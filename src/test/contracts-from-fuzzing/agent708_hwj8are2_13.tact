struct Sample {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
}

contract ManyOptionals {
    s: Sample;

    init() {
        self.s = Sample{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: 5
        };
    }
}