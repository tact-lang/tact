import "@stdlib/deploy"; // Required for sender() and SendParameters

message DataMessage {
    value: Int as uint32;
}

contract Sender {
    owner: Address;

    init() {
        self.owner = sender(); // Initialize owner address
    }

    receive() {
        // Send a message to the owner address
        send(SendParameters{
            to: self.owner,
            value: ton("0.01"), // Minimal value
            body: DataMessage{value: 123}.toCell()
        });
    }
}