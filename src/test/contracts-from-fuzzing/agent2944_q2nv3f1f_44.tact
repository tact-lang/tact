struct Rec {
    value: Int;
    desc: String;
}

contract DefaultInlineStruct {
    rec: Rec = Rec{value: 0, desc: ""};

    init() {
        self.rec = Rec{value: 5, desc: "filled"};
    }
}