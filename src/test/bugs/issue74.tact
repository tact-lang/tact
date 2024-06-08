message MyMessage {
}

contract Issue74 {
    receive("send") {
        send(SendParameters {
            to: context().sender, 
            value: 0, 
            bounce: false,
            mode: SendIgnoreErrors,
            body: MyMessage {}.toCell()
        });
    }
}