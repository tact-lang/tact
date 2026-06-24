struct InnerMost {
    x: Int;
    y: Bool?;
    s: String;
}

struct Inner {
    info: InnerMost?;
    flag: Bool;
}

struct Outer {
    value: Int;
    inner: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            value: 77,
            inner: Inner{
                info: null,
                flag: true
            }
        };
    }

    receive() {
        let _ = self.data;
    }
}