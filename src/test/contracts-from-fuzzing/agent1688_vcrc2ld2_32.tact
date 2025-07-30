struct Sub {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct Parent {
    id: Int;
    sub: Sub;
    note: String;
}

contract TestContract {
    st: Parent;

    init() {
        self.st = Parent{
            id: 1,
            sub: Sub{o1:null, o2:true, o3:null},
            note: "note"
        };
    }
}