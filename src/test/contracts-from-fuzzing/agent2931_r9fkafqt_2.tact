struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            y: Inner{a: 2, b: true, c: myAddress(), d: "hello"},
            z: false
        };
    }
}