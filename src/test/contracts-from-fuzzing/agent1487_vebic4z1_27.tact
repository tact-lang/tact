struct NestedCombos {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int;
}

struct TopLevel {
    n1: NestedCombos;
    n2: NestedCombos;
}

contract ComboContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            n1: NestedCombos{a:1,b:null,c:null,d:2},
            n2: NestedCombos{a:3,b:true,c:"hi",d:4}
        };
    }
}