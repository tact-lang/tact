primitive Int;
primitive Slice;

trait BaseTrait {}

message Msg {
    m: Slice;
    x: Int as uint8;
}

message Msg2 {
    x: Int as uint8;
    m: Slice;
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
