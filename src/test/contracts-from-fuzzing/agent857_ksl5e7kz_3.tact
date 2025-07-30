struct Inner {
    enabled: Bool;
    note: String;
}

struct Outer {
    version: Int;
    inner: Inner;
}

contract TestContract {
    config: Outer = Outer{
        version: 1,
        inner: Inner{ enabled: true, note: "" }
    };
}