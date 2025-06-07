message MyMessage {
    value: Int;
}

contract Test {
    // Typed binary message receiver using a message type instead of struct
    receive(msg: MyMessage) {
        // Using the typed message inside receiver
        let v = msg.value;
    }
}
