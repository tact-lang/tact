message(9) VoidMsg {}

struct ContainVoid {
    emptyMsg: VoidMsg;
    count: Int;
}

contract ContainsEmptyMsg {
    data: ContainVoid;

    init() {
        self.data = ContainVoid{
            emptyMsg: VoidMsg{},
            count: 123
        };
    }
}