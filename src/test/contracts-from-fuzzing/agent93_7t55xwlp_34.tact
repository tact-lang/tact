struct StructWithStringOpt {
    inner: String?;
}

contract ContractWithStructStringOpt {
    f: StructWithStringOpt = StructWithStringOpt{ inner: null };
}