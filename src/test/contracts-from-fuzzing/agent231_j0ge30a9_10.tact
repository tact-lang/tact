struct DefaultsInner {
    a: Int = -10;
    b: Bool = true;
}

contract NestedDefaultStructPersistTest {
    s: DefaultsInner;
    
    init() {
        self.s = DefaultsInner{};  // no args, uses defaults
    }
}