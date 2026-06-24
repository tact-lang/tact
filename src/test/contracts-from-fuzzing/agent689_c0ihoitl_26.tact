struct NoDefaults {
    a: Int;
    b: Bool;
    c: String;
}

contract UninitializedStructWithDefaultContract {
    data: NoDefaults;

    init() {
        self.data = NoDefaults{
            a: 0,
            b: false,
            c: "",
        };
    }
}