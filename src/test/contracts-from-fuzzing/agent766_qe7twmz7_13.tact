struct Partially {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
    d: Int;
}

contract PartialDefaults {
    data: Partially;

    init() {
        self.data = Partially{
            a: 42,
            b: true,
            c: "world",
            d: 100
        };
    }
}