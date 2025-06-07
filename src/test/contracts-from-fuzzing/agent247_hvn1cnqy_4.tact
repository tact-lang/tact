struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    a: Inner;
    b: Bool?;
    c: String;
}

contract MixedTypes {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{x:1, y:true, z:"hello"},
            b: false,
            c: "world"
        };
    }
}