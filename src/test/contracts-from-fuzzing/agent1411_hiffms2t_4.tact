struct Inner {
    x: Int;
    y: Int?;
}

struct Middle {
    a: Int;
    b: Inner;
    c: Bool?;
}

struct Outer {
    first: Middle;
    second: Int;
    third: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            first: Middle{
                a: 1,
                b: Inner{x: 2, y: null},
                c: true,
            },
            second: 42,
            third: false,
        };
    }
}