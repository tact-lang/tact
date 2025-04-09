struct Inner {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Middle {
    x: String;
    y: Inner;
    z: Bool?;
}

struct Outer {
    foo: Middle;
    bar: Int;
}

contract DeepTest {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Middle{
                x: "abc",
                y: Inner{a: null, b: false, c: null},
                z: true
            },
            bar: 10
        };
    }
}