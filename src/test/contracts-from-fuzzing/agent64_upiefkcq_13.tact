message MsgA {
    value: Int;
}

message MsgB {
    flag: Int;
}

contract TestMultipleTypedReceivers {
    // Two distinct typed binary message receivers
    receive(msg: MsgA) {
        // handle MsgA
    }

    receive(msg: MsgB) {
        // handle MsgB
    }
}

// Minimal contract to test multiple non-conflicting typed message receivers