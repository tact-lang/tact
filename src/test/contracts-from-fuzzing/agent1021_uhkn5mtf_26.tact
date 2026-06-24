// contract with optional and non-optional chain
struct Leaf { val: Int; }
struct Middle { l: Leaf?; }
struct Top { m: Middle; }

contract MixedChain {
    t: Top;

    init() {
        self.t = Top{
            m: Middle{ l: null },
        };
    }
}