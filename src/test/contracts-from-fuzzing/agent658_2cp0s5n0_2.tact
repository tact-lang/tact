struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
}

struct Outer {
    nested: Inner;
    optional1: Int?;
    optional2: String?;
    flag: Bool;
}

contract C {
    s: Outer;

    init() {
        self.s = Outer{
            nested: Inner{val1: 1, val2: true, val3: "test", val4: emptyCell()},
            optional1: null,
            optional2: "hello",
            flag: false
        };
    }
}