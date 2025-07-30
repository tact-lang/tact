struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
}

contract DeepNestedStructField {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{ x: 10, y: 20 },
            b: Inner{ x: 30, y: 40 }
        };
    }
}