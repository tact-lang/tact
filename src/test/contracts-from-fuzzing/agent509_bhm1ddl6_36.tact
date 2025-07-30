message(0x1) EmptyMsg {}

struct Container {
    note: EmptyMsg;
}

contract WithMessageStructField {
    val: Container;

    init() {
        self.val = Container{ note: EmptyMsg{} };
    }
}