struct SInner { a: Int }

contract WithArrayFields {
    x1: SInner; x2: SInner; x3: SInner; x4: SInner; x5: SInner;

    init() {
        self.x1 = SInner{ a: 1 };
        self.x2 = SInner{ a: 2 };
        self.x3 = SInner{ a: 3 };
        self.x4 = SInner{ a: 4 };
        self.x5 = SInner{ a: 5 };
    }
}
