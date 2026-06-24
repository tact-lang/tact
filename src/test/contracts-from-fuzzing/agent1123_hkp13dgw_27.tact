struct Wrap {
    innerVal: Int?;
}

contract OptionalInStruct {
    data: Wrap;

    init() {
        self.data = Wrap{innerVal:null};
    }
}