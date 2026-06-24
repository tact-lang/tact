struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    val: Int;
    nested: Inner;
}

contract DeepNestedStructField {
    data: Outer;
    init() {
        self.data = Outer{
            val: 7,
            nested: Inner{ flag: false, count: 99 }
        };
    }
}