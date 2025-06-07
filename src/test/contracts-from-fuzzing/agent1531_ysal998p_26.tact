struct Outer {
    inner: Inner;
}

struct Inner {
    x: Int;
    y: String;
    z: Bool;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x:5,
                y:"str",
                z:true,
            }
        };
    }
}
