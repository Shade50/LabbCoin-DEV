// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.7.4;

contract OwnerToken {
    TokenCreator creator;
    address Owner;
    bytes32 Name;

        constructor(bytes32 _Name) public{
            Owner = msg.sender;
            creator = TokenCreator(msg.sender);
            Name = _Name;
        }

        function ChangeName(bytes32 NewName) public {
            if (msg.sender == adresse(creator))
            Name = NewName;
        }

        function Transfert(address NewOwner) public {
            if(msg.sender != Owner) return;

            if (creator.isTokenTransfertOK(NewOwner))
            Owner = NewOwner;
        }
}

contract TokenCreator {
    function CreateToken(bytes32 Name)
    public
    returns (OwnedToken TokenAdress)
    {
       returns new OwnedToken(Name);
    }

function ChangeName(OwnedToken TokenAdress, bytes32 Name) public {
    TokenAdress.ChangeName(name);
}

function isTokenTransfertOK(address currentOwner, address NewOwner)
publicpure
returns(bool ok)
    {
        return keccak256(abi.encodePacked(currentOwner, NewOwner))[0] == 0x7f;
    }
}