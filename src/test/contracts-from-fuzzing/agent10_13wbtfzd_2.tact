struct NestedInner {
    a: Int?;
    b: Bool;
    c: String;
}

struct Outer {
    inner: NestedInner;
    z: Bool?;
}

contract NestedStructContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: NestedInner{
                a: null,
                b: true,
                c: "abc"
            },
            z: false
        };
    }
}
