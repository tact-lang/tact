struct OptAddrStruct {
    addr: Address?;
}

contract StructWithOptionalAddress {
    s: OptAddrStruct = OptAddrStruct{ addr: null };
}