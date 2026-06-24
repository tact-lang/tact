struct DeepInner {
    di: Int;
    db: Bool;
}

struct Middle {
    inner: DeepInner;
    s: String;
}

struct Outer {
    m: Middle;
    c: Cell;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{ inner: DeepInner{ di: 5, db: false }, s: "yo" },
            c: emptyCell()
        };
    }
}
