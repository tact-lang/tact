struct Inner {
    x: Int = 1;
    y: Bool = true;
}

contract TestContract {
    nested: Inner = Inner{};
    
    init() {}
}
