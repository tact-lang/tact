struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    inner: Inner;
    y: String?;
}

contract Deep {
    data: Outer = Outer { x: 1, inner: Inner{ a:2, b:null }, y: null };

    init() {
        self.data = Outer { x:3, inner: Inner{ a:4, b:true }, y: "hi" };
    }
}