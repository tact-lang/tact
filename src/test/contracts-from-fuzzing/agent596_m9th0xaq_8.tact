struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String?;
    h: Bool?;
    i: Inner;
    j: InnerOpt;
}

struct Inner {
    x: Int;
    y: Bool;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract MixTest {
    combo: Combo;

    init() {
      self.combo = Combo{
        a: 1,
        b: false,
        c: "hi",
        d: emptyCell(),
        e: emptyCell().asSlice(),
        f: beginCell(),
        g: null,
        h: null,
        i: Inner{ x: 5, y: true },
        j: InnerOpt{ x: null, y: false }
      };
    }
}