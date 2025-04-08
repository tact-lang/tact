struct Param1 {x: Int}
struct Param2 {y: Int}

struct Containing {
    p1: Param1;
    p2: Param2;
}

contract DoubleNested {
    content: Containing;

    init() {
        self.content = Containing{
            p1: Param1{ x: 1 },
            p2: Param2{ y: 2 }
        };
    }
}