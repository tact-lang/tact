struct S { f: Int }

contract TestFieldAccess {
    receive() {
        let s: S = S { f: 42 };
        dump(s.f);
    }
}
