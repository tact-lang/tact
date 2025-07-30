struct WithLotsOfOptionals { a: Int?; b: Bool?; c: Cell?; d: Slice?; e: Builder?; f: Address?; g: Int?; h: Bool?; i: Cell?; j: Slice?; k: Address?; }

contract ManyOptionals {
    big: WithLotsOfOptionals;

    init() {
        self.big = WithLotsOfOptionals{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null, k: null,
        };
    }
}