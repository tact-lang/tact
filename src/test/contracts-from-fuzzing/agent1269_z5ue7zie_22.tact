struct Deep {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct Deeper {
    d1: Deep;
    d2: Deep;
}

struct Deepest {
    dd: Deeper;
}

contract TestContract {
    nested: Deepest;

    init() {
        self.nested = Deepest{ dd: Deeper{
            d1: Deep{f1:1,f2:"one",f3:true},
            d2: Deep{f1:2,f2:"two",f3:false}
        }};
    }
}