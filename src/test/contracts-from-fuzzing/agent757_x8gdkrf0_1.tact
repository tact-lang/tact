struct Nested { inner: Int; } 

contract TestContract {
    nested: Nested; 

    init() {
        self.nested = Nested{inner: 42};
    }
}