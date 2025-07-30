// deeply nested optional inside structs with multiple optionals
struct SInner {
    num: Int?;
    flag: Bool?;
    note: String?;
}

struct SMid {
    inn: SInner?;
    other: Int;
}

contract OptDeep {
    state: SMid;

    init() {
        self.state = SMid{
            inn: SInner{
                num: null,
                flag: null,
                note: null
            },
            other: 8
        };
    }
}