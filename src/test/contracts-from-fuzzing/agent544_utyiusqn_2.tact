struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

struct Outer {
    x: Inner;
    y: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{
                a: 10,
                b: true,
                c: myAddress(),
            },
            y: false,
        };
    }
}