struct LittleOne {
    a: Int as int64;
    b: Int as uint4;
    c: Bool;
}

struct BigOne {
    lo: LittleOne;
    d: Int;
    e: Bool?;
    f: String?;
}

contract Test {
    data: BigOne;

    init() {
        self.data = BigOne{
            lo: LittleOne{ a: 50, b: 10, c: true },
            d: 100,
            e: null,
            f: null,
        };
    }
}