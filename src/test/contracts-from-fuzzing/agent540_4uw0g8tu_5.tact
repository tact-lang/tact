struct Inner {
    flag: Bool;
    num: Int?;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
}

contract OptionalNested {
    info: Outer?;

    init() {
        self.info = Outer{
            a: 1,
            b: true,
            c: Inner{
                flag: false,
                num: null
            }
        };
    }
}