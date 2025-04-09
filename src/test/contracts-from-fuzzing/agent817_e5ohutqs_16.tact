struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
}

contract Test {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}