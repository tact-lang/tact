struct OptsDefaulted {
    a: Int?; 
    b: Int?;
}

contract NestedOptDefault {
    opts: OptsDefaulted = OptsDefaulted{};
}