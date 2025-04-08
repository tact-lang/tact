struct InnerMost { x: Int; y: Bool; }
struct Inner { a: InnerMost; b: String; }
struct Outer { first: Inner; second: Inner; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            first: Inner{
                a: InnerMost{ x: 1, y: true },
                b: "one",
            },
            second: Inner{
                a: InnerMost{ x: 2, y: false },
                b: "two",
            },
        };
    }
}