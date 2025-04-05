struct Dummy {
    a: Int;
    b: Int;
}

contract Test {
    receive() {
        let st: Dummy = Dummy{ a: 1, b: 2 };
        let Dummy{ a, .. } = st;
        let _ = a + 0;
    }
}
