struct Outer {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int;
    name: String;
}

contract StructInStruct {
    val: Outer;

    init() {
        self.val = Outer{
            x: 99,
            inner: Inner{
                y: 100,
                name: "foo",
            },
        };
    }
}