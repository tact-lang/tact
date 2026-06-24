message Empty {}

contract MsgField {
    m: Empty;

    init() {
        self.m = Empty{};
    }
}