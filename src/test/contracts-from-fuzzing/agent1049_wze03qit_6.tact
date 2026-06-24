struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    val: Int;
    nested: Inner?;
    txt: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: 10,
            nested: null,
            txt: "hi"
        };
    }
}