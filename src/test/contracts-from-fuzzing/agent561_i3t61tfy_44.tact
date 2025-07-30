struct S { a: Int; b: String? }

contract NestedLayers {
    f1: S;
    f2: S;
    f3: S;
    f4: S;

    init() {
        self.f1 = S{a:1,b:null};
        self.f2 = S{a:2,b:null};
        self.f3 = S{a:3,b:null};
        self.f4 = S{a:4,b:null};
    }
}