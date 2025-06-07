struct InnerMost { v: Int; }
struct Middle { a: Int; b: InnerMost; }
struct Outer { x: Middle; y: Bool; }

contract MultiNestTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: Middle{
                a: 5,
                b: InnerMost{ v: 10 }
            },
            y: false
        };
    }
}