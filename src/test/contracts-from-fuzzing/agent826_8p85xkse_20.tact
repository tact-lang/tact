message C { val: Int; }
message B { c: C; }
message A { b: B; }

contract TestContract {
    mymsg: A = A{ b: B{ c: C{ val: 5 } } };

    init() {
        self.mymsg = A{ b: B{ c: C{ val: 10 } } };
    }
}
