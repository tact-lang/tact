struct Deep {
    str: String;
    sopt: String?;
}

contract OptionalDefaultMix {
    val: Deep;

    init() {
        self.val = Deep{str:"hi", sopt:null};
    }
}