trait BaseTrait { }

message Msg {}

contract Example {
    receive(msg: Msg) { }
    receive(msg: Msg) { }
}

