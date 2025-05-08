message Msg {
    a: Int;
    b: Int
}

contract Test {
    fun getA(m: Msg): Int {
        let Msg { a, b: _ } = m;
        return a;
    }
    receive() {}
}
