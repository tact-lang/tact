inline fun inlineTest(a: Int): Int {
    return a * 2;
}

contract TestInline {
    receive() {
        let r = inlineTest(3);
        if (r != 6) {
            throw(1);
        }
    }
}
