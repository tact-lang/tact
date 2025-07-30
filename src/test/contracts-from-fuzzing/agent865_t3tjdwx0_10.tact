struct Payload {
    msg: String = "default";
    code: Int as int64;
}

contract OptContract {
    payload: Payload?;

    init() {
        self.payload = null;
    }
}
