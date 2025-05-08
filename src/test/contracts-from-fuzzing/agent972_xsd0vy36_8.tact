struct NoDefaults {
    a: Int;
    b: Bool;
    c: String;
}

contract TestUninitializedStorage {
    data: NoDefaults;

    init() {
        self.data = NoDefaults{
            a: 123,
            b: true,
            c: "abc"
        };
    }
}
