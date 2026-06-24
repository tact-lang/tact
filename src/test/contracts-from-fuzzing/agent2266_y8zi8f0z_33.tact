struct Rec {
    id: Int;
    data: String;
    note: String?;
}

contract Test {
    first: Rec;
    second: Rec;

    init() {
        self.first = Rec{id:1, data:"one", note:null};
        self.second = Rec{id:2, data:"two", note:"some note"};
    }
}
