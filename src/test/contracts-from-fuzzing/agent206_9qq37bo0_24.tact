struct PartialDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Int = 5;
}

contract PartialInit {
    data: PartialDefaults;

    init() {
        self.data = PartialDefaults{
            a: 100,
            c: "changed"
        };
    }
}
