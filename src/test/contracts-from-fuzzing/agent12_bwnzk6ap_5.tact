message MyMsg {
    value: Int;
}

message MyOtherMsg {
    info: String;
}

contract MultiBounce {
    bounced(msg: bounced<MyMsg>) {
        // Bounce handler for MyMsg
    }
    bounced(msg: bounced<MyOtherMsg>) {
        // Bounce handler for MyOtherMsg
    }
}
