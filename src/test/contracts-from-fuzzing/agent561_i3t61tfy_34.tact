struct S2 {
    x: Int;
    y: Bool;
}

contract NestedDuplicateStructs {
    f1: S2;
    f2: S2;

    init() {
        self.f1 = S2{x:1,y:true};
        self.f2 = S2{x:2,y:false};
    }
}