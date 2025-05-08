struct Defaults {
    s: String = "default";
    n: Int = 123;
    b: Bool = false;
}

contract DefaultFields {
    val: Defaults;

    init() {
        self.val = Defaults{
            s: "changed",
            n: 321,
            b: true,
        };
    }
}
