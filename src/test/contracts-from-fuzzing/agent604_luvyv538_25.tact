struct InnerStruct {
    s: String?;
    n: Int?;
}

contract DefaultStructOpt {
    field: InnerStruct = InnerStruct{ s: null, n: null };
}