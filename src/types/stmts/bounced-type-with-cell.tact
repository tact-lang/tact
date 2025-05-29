primitive Int;
primitive Cell;

trait BaseTrait {}

message Msg {
    m: Cell;
    x: Int as uint8;
}

message Msg2 {
    x: Int as uint8;
    m: Cell;
}

contract Test {
    receive() {}

    bounced(msg: bounced<Msg>) {
        dump(msg.x);
    }

    bounced(msg: bounced<Msg2>) {
        dump(msg.x);
    }
}
