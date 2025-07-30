struct OptPrim {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptPrimsTest {
    data: OptPrim;

    init() {
        self.data = OptPrim{a: null, b: null, c: null};
    }
}