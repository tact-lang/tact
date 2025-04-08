struct DefOpt {
    a: Int = 5;
    b: String?;
}

contract DefaultOptional {
    rec: DefOpt;

    init() {
        self.rec = DefOpt{b: null};
    }
}