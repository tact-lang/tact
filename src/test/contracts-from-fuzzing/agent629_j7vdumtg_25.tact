struct SOptPrim {
    n: Int?;
}
contract OptionalFieldAssign {
    s: SOptPrim;
    init() {
        self.s = SOptPrim{ n: 22 };
    }
}