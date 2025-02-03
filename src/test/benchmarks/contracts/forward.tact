message TestGetFwdFee {
    any: Slice;
}

asm fun touch(x: Int) {
    NOP
}

contract Forward {
    receive(msg: TestGetFwdFee) {
        touch(context().readForwardFee());
    }
}
