struct Inner {
    a: Int; 
    b: String;
}

struct Middle {
    x: Bool;
    y: Inner;
}

struct Outer {
    left: Middle;
    right: Middle;
}

contract NestedStructs {
    info: Outer;

    init() {
        self.info = Outer{
            left: Middle{
                x: true,
                y: Inner{ a: 1, b: "a" }
            },
            right: Middle{
                x: false,
                y: Inner{ a: 2, b: "b"}
            }
        };
    }
}