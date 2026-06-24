struct MixOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: MixOpt;

    init() {
        self.data = MixOpt{ a: null, b: true, c: null, d: myAddress() };
    }
}