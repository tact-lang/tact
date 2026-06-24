struct DoubleOpt {
    a: Int?;
    b: Bool?;
}

contract ChainOptInit {
    first: DoubleOpt?;

    init() {
        self.first = null;
    }
}