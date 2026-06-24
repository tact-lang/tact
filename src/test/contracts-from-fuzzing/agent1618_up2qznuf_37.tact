struct SomeDefaults {
    s: String;
    n: Int? = null;
    i: Int as uint8;
    b: Bool;
}

contract PartialInit {
    data: SomeDefaults;

    init() {
        self.data = SomeDefaults{
            s: "hi",
            i: 128,
            b: false
        };
    }
}