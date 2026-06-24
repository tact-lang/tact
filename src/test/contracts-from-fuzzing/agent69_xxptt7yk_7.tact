struct S {
    x: Int;
}

contract FieldAccessTest {
    receive() {
        let s: S = S { x: 10 };
        dump(s.x);
    }
}
