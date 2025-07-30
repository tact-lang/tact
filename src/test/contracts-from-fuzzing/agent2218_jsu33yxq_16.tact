struct ComboDeep {
    s1: SubOne;
    s2: SubTwo;
    flag: Bool;
}

struct SubOne {
    a: Int;
    b: String?;
}

struct SubTwo {
    c: Bool?;
    d: Slice;
}

contract Test {
    data: ComboDeep;

    init() {
        self.data = ComboDeep{
            s1: SubOne{a:42,b:null},
            s2: SubTwo{c:true,d:emptyCell().asSlice()},
            flag: false
        };
    }
}