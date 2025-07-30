struct DefaultsVsInit {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
}

contract OverwriteDefaults {
    val: DefaultsVsInit;

    init() {
        self.val = DefaultsVsInit{
            a: 123,
            b: true,
            c: "override"
        };
    }
}