struct Inner {
    i: Int;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract MixedOrder {
    foo: Int;
    bar: Outer;
    baz: String;
    init() {
        self.foo = 100;
        self.bar = Outer{ x: 5, y: Inner{i:9}, z:true };
        self.baz = "hi";
    }
}