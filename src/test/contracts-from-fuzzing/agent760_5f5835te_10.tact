message(99) OptMsg {
    data: Int;
}

contract OptionalMsg {
    val: OptMsg? = null;

    init() {
        self.val = OptMsg{
            data: 1000,
        };
    }
}