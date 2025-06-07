inline fun add(x: Int, y: Int): Int { return x + y; }

contract TestInline {
    receive() {
        let r = add(3, 4);
        let _ = r;
        return;
    }
}
