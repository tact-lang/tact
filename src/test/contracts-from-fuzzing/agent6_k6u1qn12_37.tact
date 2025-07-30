message Msg {
    f: Int;
}

fun getF(m: Msg): Int {
    return m.f;
}

contract Test {
    receive(msg: Msg) {
        let x = getF(msg);
    }
}