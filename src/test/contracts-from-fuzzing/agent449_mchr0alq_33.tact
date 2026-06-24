message(1) EmptyMsg {}

contract OptionalMessageField {
    m: EmptyMsg?;

    init() {
        self.m = EmptyMsg{};
    }
}
