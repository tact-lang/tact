message(7) PingMsg {
    payload: String;
}

contract ParamOptionalMessage(
    ping: PingMsg?,
) {}