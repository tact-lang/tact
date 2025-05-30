message(0x42) EmptyMessage {}

contract CM {
    m: EmptyMessage;

    init() {
        self.m = EmptyMessage {};
    }

    receive() {
        let _ = self.m;
    }
}