message(0x99) OptMsg { val: Int }

contract OptionalMessageField {
    optmsg: OptMsg?;

    init() {
        self.optmsg = OptMsg{val:123};
    }
}