message MyMsg {
    value: Int;
}

contract Test {
    // Declaring the fallback receiver first, then the type-specific receiver
    receive(msg: Slice) {
        // fallback receiver
    }

    receive(msg: MyMsg) {
        // type-specific receiver
    }
}
