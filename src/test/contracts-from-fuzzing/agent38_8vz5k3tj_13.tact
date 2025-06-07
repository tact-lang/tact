extends fun mulDiscard(self: Int, _ : Int): Int {
    return self;
}

contract TestExtUnderscore {
    receive() {
        dump(5.mulDiscard(7));
    }
}
