struct Inner {
    a: Int?; // optional int
    b: Bool?; // optional bool
}

contract TestContract {
    nested_optional: Inner = Inner{a: null, b: null};
    init() {}
}