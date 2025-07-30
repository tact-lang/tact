struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract ManyOptions {
    m: MultiOpt;

    init() {
        self.m = MultiOpt{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}