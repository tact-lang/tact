struct Inner {
    foo: Bool?;
    bar: Int = 5;
}

struct Outer {
    inner: Inner?;
    flag: Bool = false;
}

contract OptionalStructDefault {
    val: Outer;

    init() {
        self.val = Outer{
            inner: null,
            flag: true
        };
    }
}