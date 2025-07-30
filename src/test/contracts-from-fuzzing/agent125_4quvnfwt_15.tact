message MyMsg { value: Int; }

contract Test {
    // Receiver for a typed binary message
    receive(msg: MyMsg) {
        // processing typed message
    }
}
