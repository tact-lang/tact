struct TwoOpt {
    optA: Int?;
    optB: Int?;
}

contract AdjacentOptionals {
    d: TwoOpt;

    init() {
        self.d = TwoOpt{ optA: null, optB: 42 };
    }
}