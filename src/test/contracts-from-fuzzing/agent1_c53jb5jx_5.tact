
import "@stdlib/deploy";

message MyMessage {
    val: Int as uint32;
}

contract Sender {
    receiver: Address;

    init(receiver: Address) {
        self.receiver = receiver;
    }

    receive("send message") {
        let msg: MyMessage = MyMessage{val: 1};
        send(SendParameters{
            to: self.receiver,
            value: ton("0.01"),
            body: msg.toCell() // Explicitly call .toCell()
        });
    }
}
