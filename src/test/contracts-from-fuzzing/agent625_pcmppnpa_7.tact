struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullInit {
    opt: MultiOpt;

    init() {
        self.opt = MultiOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}