struct Inner {
    flag: Bool;
    number: Int;
}

struct Outer {
    text: String;
    inner: Inner;
}

contract NestedStructContract {
    value: Outer;
    
    init() {
        self.value = Outer{
            text: "deep",
            inner: Inner{ flag: true, number: 42 }
        };
    }
}