struct StructWithBoolOpt {
    inner: Bool?;
}

contract ContractWithStructBoolOpt {
    f: StructWithBoolOpt = StructWithBoolOpt{ inner: null };
}