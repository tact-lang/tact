struct DefOpt {
    x: Int? = null;
    y: Int? = null;
}

contract DefOptField {
    data: DefOpt;

    init() {
        self.data = DefOpt{x:null, y:null};
    }
}