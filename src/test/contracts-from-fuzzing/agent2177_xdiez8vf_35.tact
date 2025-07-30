message(123) Empty {}

contract EmptyMsgField {
    m: Empty;

    init() {
        self.m = Empty{};
    }
}