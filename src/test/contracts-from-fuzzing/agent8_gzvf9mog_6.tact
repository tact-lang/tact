/// Test 6: Branch conditional initOf usage

contract OptionA {
    init(x: Int) {
        // OptionA initialization
    }
}

contract OptionB {
    init(y: Int) {
        // OptionB initialization
    }
}

contract Switch {
    // Function that conditional returns the code of one of two contracts
    fun choose(x: Int, flag: Bool) : Cell {
       let s: StateInit = flag ? initOf OptionA(x) : initOf OptionB(x + 100);
       return s.code;
    }
}
