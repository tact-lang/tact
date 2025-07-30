struct NestedStuff {
    a: Int;
    b: String;
    c: Bool;
}

contract LotsOfNested {
    f1: NestedStuff;
    f2: NestedStuff;
    f3: NestedStuff;
    f4: NestedStuff;

    init() {
        self.f1 = NestedStuff{ a:1, b:"A", c:true };
        self.f2 = NestedStuff{ a:2, b:"B", c:false };
        self.f3 = NestedStuff{ a:3, b:"C", c:true };
        self.f4 = NestedStuff{ a:4, b:"D", c:false };
    }
}