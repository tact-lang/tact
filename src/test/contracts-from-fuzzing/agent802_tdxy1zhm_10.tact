struct Inner {
    a: Int;
    b: Bool;
    c: String;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract MultiTypeOptionalsTest {
    field: Inner;

    init() {
        self.field = Inner{
            a: 1,
            b: false,
            c: "abc",
            opt1: null,
            opt2: null,
            opt3: "not null",
        };
    }
}