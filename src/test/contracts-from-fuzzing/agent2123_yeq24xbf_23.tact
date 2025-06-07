struct ComplexOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptStructTest {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            x: null,
            y: true,
            z: null,
            addr: null,
            c: emptyCell(),
            sl: null
        };
    }
}