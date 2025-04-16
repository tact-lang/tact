struct DeepOptDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract TestContract {
    val: DeepOptDefaults;
    
    init() {
        self.val = DeepOptDefaults{};
    }
}