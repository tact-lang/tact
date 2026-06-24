message MyMsg {
    value: Int;
}

contract First {
    // Bounce receiver: gets bounced message of type MyMsg
    bounced(msg: bounced<MyMsg>) {
        // Handle bounced message
    }

    // Sends a message to a Second contract with bounce enabled
    fun sendToSecond(addr: Address) {
        // Create a message cell from MyMsg
        send(SendParameters{
            to: addr,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: MyMsg{ value: 42 }.toCell()
        });
    }
}

contract Second {
    // Receive a MyMsg; purposely fail to process it to trigger bouncing
    receive(msg: MyMsg) {
        // Force failure to trigger bounce
        require(false, "Forced failure to trigger bounce");
    }
}
