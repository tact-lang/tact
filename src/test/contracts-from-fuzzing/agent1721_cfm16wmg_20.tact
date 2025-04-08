struct OmitSomeDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract PartialInit {
    data: OmitSomeDefaults;

    init() {
        self.data = OmitSomeDefaults{
            a: 100,
            e: "custom"
        };
    }
}