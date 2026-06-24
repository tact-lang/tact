struct MultiDefaults {
    a: Int = 10;
    b: Int?;
    c: String = "hi";
    d: Bool = false;
    e: Bool?;
}

contract TestContract {
    data: MultiDefaults;

    init() {
        self.data = MultiDefaults{
            // omit all optional/default fields
        };
    }
}