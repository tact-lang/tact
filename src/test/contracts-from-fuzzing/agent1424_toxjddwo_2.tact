struct DeepNest {
    lvl1: Int?;
    lvl2: Inner;
    lvl3: Bool;
}

struct Inner {
    a: Bool;
    b: Int?;
    c: String;
}

contract ComplexContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            lvl1: null,
            lvl2: Inner{a: true, b: null, c: "hello"},
            lvl3: false
        };
    }
}