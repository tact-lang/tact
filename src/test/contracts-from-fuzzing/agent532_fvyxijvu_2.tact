struct Inner {
    k: Int?;
    l: String;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract NestedStructContract {
    record: Outer;

    init() {
        self.record = Outer{
            x: 5,
            y: Inner{
                k: null,
                l: "abc"
            }
        };
    }
}