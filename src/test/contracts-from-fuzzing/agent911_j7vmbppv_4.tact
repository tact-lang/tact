struct SimpleFlat {
    s: String;
    f: Bool;
    n: Int;
    o: Int?;
}

contract TestSimpleFlat {
    value: SimpleFlat;

    init() {
        self.value = SimpleFlat{
            s: "Hello",
            f: true,
            n: 123,
            o: null
        };
    }
}