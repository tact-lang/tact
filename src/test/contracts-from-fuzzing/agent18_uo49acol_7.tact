message OptionalMsg {
    a: Int?;
}

contract TestOptionalMsg() {
    receive(msg: OptionalMsg) {
        // If 'a' is not null, use non-null assertion, else use default 0
        if (msg.a != null) {
            dump(msg.a!!);
        } else {
            dump(0);
        }
    }
}
