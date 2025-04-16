// Message struct with optional fields
message(10) MsgOptionals {
    x: Int?;
    y: Bool?;
}

contract MsgOptionalHolder {
    m: MsgOptionals;

    init() {
        self.m = MsgOptionals{ x: null, y: true };
    }
}
