message NestedMessage {
    innerValue: Int;
}

message OuterMessage {
    outerValue: String;
    nested: NestedMessage;
}

contract TestContract {
    receive(msg: OuterMessage) {
        let x = msg.outerValue;
        let y = msg.nested.innerValue;
    }
}