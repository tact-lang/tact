struct Cont {
    num: Int;
    sub: SubCont;
}

struct SubCont {
    flag: Bool;
    s: String?;
}

contract NestedOptStringDeep {
    data: Cont;
    init() {
        self.data = Cont{
            num: 5,
            sub: SubCont{ flag: true, s: null }
        };
    }
}