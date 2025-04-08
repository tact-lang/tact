struct DeepAndWide {
    a: Int;
    b: Int;
    c: Inner1;
    d: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool?;
}

struct Inner2 {
    s: String?;
    f: Bool;
}

contract DeepWideTest {
    val: DeepAndWide = DeepAndWide{
        a:1, b:2,
        c: Inner1{ x: 3, y: null },
        d: Inner2{ s: null, f: false }
    };

    init() {
        self.val = DeepAndWide{
            a:10, b:20,
            c: Inner1{ x: 30, y: true },
            d: Inner2{ s: "hi", f: true }
        };
    }
}
