struct InnerMost { x: Int }

struct Middle { a: InnerMost; b: Int }

struct Outer { m: Middle; y: Int }

contract DeepChain {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{ a: InnerMost{ x: 42 }, b: 5 },
            y: 10
        };
    }
}