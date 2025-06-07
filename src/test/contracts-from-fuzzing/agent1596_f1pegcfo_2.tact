struct Inner {
    x: Int = 7;
    y: Bool?; 
}

contract Test {
    nested: Inner = Inner{};
    init() {}
}