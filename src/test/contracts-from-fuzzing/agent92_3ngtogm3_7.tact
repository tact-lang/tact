message MyMessage {
    value: Int;
}

contract TestUnderscore {
    // Test usage of underscore to discard parameter value
    receive(_: MyMessage) {
        // No operations, parameter is discarded
    }

    fun dummy() : Int {
        return 0;
    }
}
