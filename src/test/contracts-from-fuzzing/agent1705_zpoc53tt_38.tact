message EmptyMsg {}

contract OptionalEmptyMessage {
    f: EmptyMsg?;

    init() {
        self.f = null;
    }
}