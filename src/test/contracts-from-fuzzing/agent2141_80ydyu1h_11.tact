struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    x: Inner;
    y: Int;
}

struct Outer {
    data: Middle;
    val: String;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            data: Middle{
                x: Inner{ a: 5, b: true },
                y: 42
            },
            val: "hi"
        };
    }
}