struct DefStruct {
    a: Int = 1;
    b: Bool = true;
    txt: String = "X";
}

contract PartialAssign {
    data: DefStruct;

    init() {
        self.data = DefStruct{
            a: 42
            // omit b and txt
        };
    }
}
