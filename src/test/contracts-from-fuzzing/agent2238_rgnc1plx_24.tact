struct HasStringOpt {
    s: String?;
    num: Int;
}

contract TestContract {
    sopt: HasStringOpt;

    init() {
        self.sopt = HasStringOpt{
            s:null,
            num:123
        };
    }
}
