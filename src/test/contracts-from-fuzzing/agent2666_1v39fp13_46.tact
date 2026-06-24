struct InnerS {
    a: Int;
}

contract RecInField {
    data: InnerS;

    init() {
        self.data = InnerS{a:999};
    }
}