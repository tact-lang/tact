struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

struct Container {
    f1: LargeNested;
    f2: LargeNested;
    f3: LargeNested;
}

contract TestContract {
    c: Container;

    init() {
        let sample = LargeNested{
            a: 1, b: "abc", c: true, d: null, e: null, f: null, g: 7, h: "qwe", i: false, j: null,
        };
        self.c = Container{
            f1: sample,
            f2: sample,
            f3: sample,
        };
    }
}