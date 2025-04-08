struct Rec {
    num: Int;
    flag: Bool;
    text: String;
}

struct WrapperStruct {
    rec: Rec;
    num: Int;
}

contract RecInWrapper {
    data: WrapperStruct;
    init() {
        self.data = WrapperStruct{
            rec: Rec{ num: 7, flag: true, text: "x" },
            num: 5,
        };
    }
}
