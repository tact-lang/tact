message MsgB {}

contract A {
    partner: Address;
    counter: Int;

    init(partner: Address) {
       self.partner = partner;
       self.counter = 0;
    }

    bounced(msg: bounced<MsgB>) {
       // Increase counter
       self.counter = self.counter + 1;
       // Forward bounce message to the partner contract
       self.forward(self.partner, "bounce from A".asComment(), true, null);
    }

    receive() {
       send(SendParameters{
         bounce: true,
         to: self.partner,
         value: 0,
         body: MsgB{}.toCell()
       });
    }
}

contract B {
    partner: Address;

    init(partner: Address) {
       self.partner = partner;
    }

    bounced(rawMsg: Slice) {
       // Forward bounce message back to the partner contract
       self.forward(self.partner, "bounce from B".asComment(), true, null);
    }

    receive() {}
}
