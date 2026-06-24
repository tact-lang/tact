struct In {
    x: Int;
    b: Bool;
    s: String;
}

struct Out {
    i: Int;
    inner: In;
    o: Int?;
    ob: Bool?;
    os: String?;
}

contract ComboTest {
    nested: Out;

    init() {
        self.nested = Out{
            i: 1,
            inner: In{ x:2, b:true, s:"hi" },
            o: null, ob: false, os: "opt"
        };
    }
}
