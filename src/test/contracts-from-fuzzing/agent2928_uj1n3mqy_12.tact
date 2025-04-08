struct InnerOpt {
    n: Int?;
}

contract OptDirectAndStruct {
    directOpt: Int?;
    nestedOpt: InnerOpt = InnerOpt{ n: null };
}