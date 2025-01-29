message Add {
    value: Int;
}

message Sub {
    value: Int;
}

message TestGetFwdFee {
    any: Slice;
}

contract Functions {
    value: Int;

    init() {
        self.value = 0;
    }

    fun update(delta: Int) {
        self.value = self.value + delta;
    }

    receive(msg: Add) {
        require(msg.value > 0, "Value must be greater than 0");
        self.update(msg.value);
    }

    receive(msg: Sub) {
        require(msg.value > 0, "Value must be greater than 0");
        self.update(-msg.value);
    }
    receive(msg: TestGetFwdFee) {

    }
}
