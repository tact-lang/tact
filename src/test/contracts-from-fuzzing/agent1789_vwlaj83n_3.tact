struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Inner; 
    y: String?;
    z: Int;
}

struct Outer {
    m: Middle;
    n: Bool;
}

contract DeepStructTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            m: Middle{
                x: Inner{
                    a: 123,
                    b: false
                },
                y: null,
                z: 456
            },
            n: true
        };
    }
}