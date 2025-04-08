struct EdgeDefaults {
    a: Int = 7;
    b: Bool;
    c: Bool? = null;
    d: Int?;
}

contract DefaultsContract {
    data: EdgeDefaults;

    init() {
        self.data = EdgeDefaults{
            b: true,
            d: 42
        };
    }
}