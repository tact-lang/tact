struct InnerMost { x: Int; y: Int; }
struct Inner { nested: InnerMost; flag: Bool; }
struct Middle { inner: Inner; s: String; }
struct Outer { middle: Middle; b: Bool; n: Int; }

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    nested: InnerMost{ x: 1, y: 2 },
                    flag: true
                },
                s: "str"
            },
            b: false,
            n: 42
        };
    }
}