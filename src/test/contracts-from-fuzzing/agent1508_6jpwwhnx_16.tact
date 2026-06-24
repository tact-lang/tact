struct S {
    field: Int;
}

contract TestContract {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;
    f6: S;
    f7: S;
    f8: S;

    init() {
        self.f1 = S{field:1};
        self.f2 = S{field:2};
        self.f3 = S{field:3};
        self.f4 = S{field:4};
        self.f5 = S{field:5};
        self.f6 = S{field:6};
        self.f7 = S{field:7};
        self.f8 = S{field:8};
    }
}