struct Mixed {
    n: Int;
    b1: Bool;
    s: String;
    b2: Bool;
    o: Int?;
}

contract MixedOrder {
    m: Mixed;

    init() {
        self.m = Mixed{
            n: 5,
            b1: true,
            s: "hello",
            b2: false,
            o: null,
        };
    }
}