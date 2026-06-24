struct Sub {
    s: String?;
}

contract Nulls {
    opt1: Int? = null;
    opt2: Bool? = null;
    subfield: Sub = Sub{ s: null };

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.subfield = Sub{ s: null };
    }
}
