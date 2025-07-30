struct S {
    val: Int;
}

contract Test {
    f0: S; f1: S; f2: S; f3: S; f4: S;
    f5: S; f6: S; f7: S; f8: S; f9: S;
    init() {
        self.f0 = S{val:0}; self.f1 = S{val:1}; self.f2 = S{val:2};
        self.f3 = S{val:3}; self.f4 = S{val:4}; self.f5 = S{val:5};
        self.f6 = S{val:6}; self.f7 = S{val:7}; self.f8 = S{val:8}; self.f9 = S{val:9};
    }
}