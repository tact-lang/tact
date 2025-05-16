struct Inner {
    v1: Int = 10;
    v2: Bool = false;
}

contract TestContract {
    nested: Inner;
    
    init() {
        self.nested = Inner{};
    }
}