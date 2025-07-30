struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract NestedStructOptFields {
    point: InnerOpt = InnerOpt{a: null, b: null};
}