message EmptyMsg {}

contract BounceRecValid {
    my_addr: Address;

    init(addr: Address) {
        self.my_addr = addr;
    }

    // Bounce receiver that recursively triggers another bounce message
    bounced(msg: bounced<EmptyMsg>) {
        send(SendParameters{
            to: self.my_addr,
            value: 0,
            bounce: true,
            mode: 0,
            body: EmptyMsg{}.toCell()
        });
    }
    
    // Standard receive function that triggers a bounce by sending a message to self
    receive(msg: EmptyMsg) {
        send(SendParameters{
            to: self.my_addr,
            value: 0,
            bounce: true,
            mode: 0,
            body: EmptyMsg{}.toCell()
        });
    }
}
