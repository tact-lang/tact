struct Deep {
    opt: Int?;
}

contract OptionalTop {
    val: Deep;

    init() {
        self.val = Deep{opt:null};
    }
}