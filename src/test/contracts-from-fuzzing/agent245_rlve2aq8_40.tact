struct BigOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
}

contract StructOnlyOptionalsTest {
    s: BigOptional;

    init() {
        self.s = BigOptional{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}