struct Rec {
    i: Int;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    msg: String?;
}

contract Test {
    data: Rec;

    init() {
        self.data = Rec{ i:1, nested: Nested{flag:true, msg:null} };
    }
}