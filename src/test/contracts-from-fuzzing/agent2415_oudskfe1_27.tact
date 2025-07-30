message EmptyMessage {}

contract WithEmptyMessage {
    dummy: Int;

    init() {
        self.dummy = 42;
    }
}