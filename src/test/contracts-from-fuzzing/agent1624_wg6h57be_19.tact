struct Child { value: Int; }

struct Middle { child: Child?; }

struct Root { mid: Middle?; }

contract OptionalMidChain {
    data: Root;

    init() {
        self.data = Root{
            mid: Middle{
                child: Child{ value: 123 }
            }
        };
    }
}