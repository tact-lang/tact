struct StructWithIntOpt {
    inner: Int?;
}

contract ContractWithStructIntOpt {
    f: StructWithIntOpt = StructWithIntOpt{ inner: null };
}