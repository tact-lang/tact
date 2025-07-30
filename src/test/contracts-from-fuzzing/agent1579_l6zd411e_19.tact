struct Unusual {
    s: String;
    n: Int;
    f: Bool;
    t: String;
    m: Int;
}

contract WeirdOrder {
    data: Unusual;

    init() {
        self.data = Unusual{
            s: "first",
            n: 123,
            f: true,
            t: "second",
            m: 456
        };
    }
    receive() {
        self.data.n += 1;
    }
}