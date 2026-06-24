struct NestedCombinations {
    a: Int;
    b: NestedLevel;
}

struct NestedLevel {
    c: Int?;
    d: Bool;
    e: InnerMost;
}

struct InnerMost {
    f: Bool?;
    g: Int;
}

contract NestedComboContract {
    data: NestedCombinations;

    init() {
        self.data = NestedCombinations{
            a:1,
            b: NestedLevel {
                c:null,
                d:true,
                e: InnerMost { f:false, g:77 }
            }
        };
    }
}