struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{
            a: 42,
            c: "hello",
            e: true,
        };
    }
}