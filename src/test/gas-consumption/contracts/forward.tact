message TestGetFwdFee {
    any: Slice;
}

asm fun touch(x: Int) {}

contract Forward {
    receive(msg: TestGetFwdFee) {
        touch(context().readForwardFee());
    }
}
