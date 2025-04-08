struct InnerS {
    x: Int;
}

struct OuterS {
    z: Int;
    opt: InnerS? = null;
}

contract OptStructDefault {
    data: OuterS;

    init() {
        self.data = OuterS{
            z: 99
        };
    }
}
