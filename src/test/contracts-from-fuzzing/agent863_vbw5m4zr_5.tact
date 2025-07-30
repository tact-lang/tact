struct MultiOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract Test {
    f: MultiOpt;

    init() {
        self.f = MultiOpt{ x: null, y: true, s: null };
    }
}