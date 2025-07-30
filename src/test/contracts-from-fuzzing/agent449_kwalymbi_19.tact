// Complex optional nesting chains
struct InnerMost {
    a: Int?;
}

struct Middle {
    b: InnerMost?;
}

struct Outer {
    c: Middle?;
}

contract TestContract {
    d: Outer;

    init() {
        self.d = Outer{
            c: Middle{
                b: InnerMost{
                    a: 50,
                },
            },
        };
    }
}
