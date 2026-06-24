message(44) InnerMsg {}

struct ContainerOptMsg {
    m: InnerMsg?;
}

contract OptMsgTop {
    holder: ContainerOptMsg;

    init() {
        self.holder = ContainerOptMsg{
            m: null
        };
    }
}
