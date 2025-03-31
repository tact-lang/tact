message MyMessage {
    data: Int;
}

// This contract will not handle MyMessage and will cause the incoming bounced message
contract Receiver {
    // No receiver defined, causing messages to bounce
}

contract Sender {
    bounced(msg: bounced<MyMessage>) {
        // Bounce receiver: handle bounced MyMessage
    }

    fun sendTo(receiver: Address) {
        send(SendParameters{
            to: receiver,
            bounce: true,
            value: 0,
            mode: 0,
            body: MyMessage{data: 123}.toCell()
        });
    }
}
