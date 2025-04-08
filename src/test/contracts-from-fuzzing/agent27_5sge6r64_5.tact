struct WithDefaults {
    a: Int = 42;
    b: Bool?; // defaults to null
    c: String = "x";
}

contract TestContract {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            // omit 'a' and 'c' (defaulted), explicit null for b
            b: null
        };
    }
}
