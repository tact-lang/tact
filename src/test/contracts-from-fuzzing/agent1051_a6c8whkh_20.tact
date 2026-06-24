// deeply nested optional inside struct
struct Inner {
    a: Int?;
}

struct Outer {
    inner: Inner;
    str: String;
}

contract TestContract {
    record: Outer;
    init() {
        self.record = Outer{
            inner: Inner{a: null},
            str: "hi"
        };
    }
}