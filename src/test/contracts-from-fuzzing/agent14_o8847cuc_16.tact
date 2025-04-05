extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestInc {
    receive() {
        let x = 10;
        x.inc();
        require(x == 11, "Extension mutates function did not increment properly");
    }
}
