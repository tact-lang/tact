primitive Int;
primitive Builder;

trait BaseTrait {}

message Msg {
    m: Builder;
    x: Int as uint8;
}

message Msg2 {
    x: Int as uint8;
    m: Builder;
}

contract Test {
    receive() {}

    bounced(msg: bounced<Msg>) {
        dump(msg.m);
    }

    bounced(msg: bounced<Msg2>) {
        dump(msg.m);
    }
}
