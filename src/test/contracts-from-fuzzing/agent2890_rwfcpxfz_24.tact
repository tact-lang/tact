struct InnerS {
    f1: Int;
    f2: Bool;
}

struct OuterS {
    s: InnerS;
    x: Int;
}

contract NestedStructRedefaults {
    data: OuterS = OuterS{
        s: InnerS{ f1:1, f2:true },
        x: 2
    };

    init() {
        self.data = OuterS{
            s: InnerS{ f1:100, f2:false },
            x: 200
        };
    }
}