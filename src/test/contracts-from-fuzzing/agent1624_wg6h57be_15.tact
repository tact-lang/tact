struct Bottom { z: Int; }

struct Middle { b: Bottom?; }

struct Top { m: Middle?; }

contract OptionalChain {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                b: null
            }
        };
    }
}