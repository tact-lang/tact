// Field names shadowed in struct and message
struct Data {
    value: Int;
}

message Msg {
    value: Int;
}

contract Test {
    receive(msg: Msg) {
        let d: Data = Data { value: msg.value };
    }
}