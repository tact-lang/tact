message BounceMsg {
    data: Int;
}

contract RecursiveBounce {
    my_address: Address;

    init() {
         self.my_address = sender();
    }

    bounced(msg: bounced<BounceMsg>) {
         self.forward(self.my_address, "retry".asComment(), true, null);
    }
}
