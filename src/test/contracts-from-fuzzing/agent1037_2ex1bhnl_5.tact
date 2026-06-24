struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            d: 123
        };
    }
}