struct AddressHolder {
    addr: Address?;
    optAddr: Address?;
}

contract ContractWithAddrs {
    ah: AddressHolder = AddressHolder{
        addr: null,
        optAddr: null,
    };
}