struct MultiLayer {
    p1: Int;
    p2: Int?;
    p3: String;
    p4: Address?;
    p5: Cell;
}

struct Wrap {
    x: MultiLayer;
    y: MultiLayer?;
}

contract Test {
    state: Wrap;

    init() {
        self.state = Wrap{
            x: MultiLayer{
                p1: 1, p2: null, p3: "hello", p4: null, p5: emptyCell()
            },
            y: null
        };
    }
}
