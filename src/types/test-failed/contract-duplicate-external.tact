trait BaseTrait { }

message Msg {}

contract Example {
    external(msg: Msg) { }
    external(msg: Msg) { }
}

