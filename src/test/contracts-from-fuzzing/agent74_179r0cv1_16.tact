struct MixAnnots {
    a: Int as uint32;
    b: Int?;
    c: Bool;
    d: Bool?;
}

contract TestContract {
    data: MixAnnots;
    init() {
        self.data = MixAnnots{ a: 4294967295, b: null, c: true, d: null };
    }
}