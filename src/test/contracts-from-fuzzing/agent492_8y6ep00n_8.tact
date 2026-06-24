struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{a:1,b:"one"},
            y: Inner{a:2,b:"two"},
            z: 3
        };
    }
}