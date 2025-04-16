struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inr: Inner;
    s: String;
}

contract NestedStructField {
    outer: Outer;

    init() {
        self.outer = Outer{
            inr: Inner{ x: 10, y: false },
            s: "nested"
        };
    }
}