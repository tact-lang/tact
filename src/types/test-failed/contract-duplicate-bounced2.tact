trait BaseTrait { }

message Msg {}

contract Example {
    bounced(msg: Msg) { }
    bounced(msg: Msg) { }
}

