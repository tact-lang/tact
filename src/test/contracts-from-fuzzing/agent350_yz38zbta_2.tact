struct Inner {
    nx: Int;
    ny: Int?;
}

struct Outer {
    inr: Inner;
    s: String;
    b: Bool;
}

contract Test2 {
    val: Outer;

    init() {
        self.val = Outer{
            inr: Inner{ nx: 5, ny: null },
            s: "hi",
            b: true
        };
    }
}
