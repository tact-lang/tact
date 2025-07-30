// default-initialized nested struct
struct Inner {
    flag: Bool = true;
    val: Int = 123;
}

struct Outer {
    inner: Inner;
    name: String = "test";
}

contract DefaultsInNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{},
            name: "override"
        };
    }
}