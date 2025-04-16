struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    count: Int;
    flag: Bool;
}

contract FuzzContract {
    value: Outer;

    init() {
        self.value = Outer{
            inner: Inner{
                a: 1,
                b: true,
                c: "x"
            },
            count: 42,
            flag: false
        };
    }
}
