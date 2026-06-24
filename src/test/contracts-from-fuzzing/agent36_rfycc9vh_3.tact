message SmallMsg {
    flag: Bool;
}

contract BounceBool {
    state: Bool;
    init() {
        self.state = false;
    }
    bounced(msg: bounced<SmallMsg>) {
        self.state = msg.flag;
    }
}
