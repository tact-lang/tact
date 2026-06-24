struct TestConsts {
    add: Int;
    bit: Int;
    shift: Int;
}

contract TestConstEval {
    // Constant arithmetic evaluation
    const addConst: Int = 3 + 5;     // expected 8
    const bitConst: Int = ~5;        // expected -6
    const shiftConst: Int = 1 << 3;  // expected 8

    // Getter returns a struct with evaluated constant values
    get fun getValues(): TestConsts {
        return TestConsts{
            add: self.addConst,
            bit: self.bitConst,
            shift: self.shiftConst
        };
    }

    receive() {
        cashback(sender());
    }
}
