message EmptyMessage {}

contract MessageAsField {
    m: EmptyMessage;

    init() {
        self.m = EmptyMessage{};
    }
}