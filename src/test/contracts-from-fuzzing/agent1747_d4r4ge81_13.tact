struct Inner {
    val: Bool?; 
}

struct Outer {
    inner: Inner;
}

contract OptionalDeepValue {
    data: Outer = Outer{
        inner: Inner{ val: true }
    };

    init() {}
}