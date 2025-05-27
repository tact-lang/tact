primitive Int;
primitive Bool;

trait BaseTrait {}

message Msg {
    m: map<Int, Int>;
    x: Int as uint8;
}

message Msg2 {
    x: Int as uint8;
    m: map<Int, Int>;
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
