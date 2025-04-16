struct PrimitivesOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    data: PrimitivesOpt;

    init() {
        self.data = PrimitivesOpt{
            a: 100,
            b: true,
            c: null
        };
    }
}