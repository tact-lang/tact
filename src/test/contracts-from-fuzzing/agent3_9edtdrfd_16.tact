extends mutates fun incr(self: Int) {
    self += 1;
}

contract TestMutate {
    receive() {
        let a = 10;
        a.incr();
        if (a != 11) { throw(1); }
        cashback(sender());
    }
}
