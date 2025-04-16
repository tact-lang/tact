message Msg { data: Int; }

contract RecursiveBounce {
    myAddr: Address;
    counter: Int = 0;

    init(myAddr_: Address) {
        self.myAddr = myAddr_;
    }
    
    // This receiver always fails, ensuring that any sent message bounces
    receive() {
        require(false, "fail");
    }

    bounced(msg: bounced<Msg>) {
        self.counter += 1;
        // Recursively send a message only if counter is less than 3 to avoid infinite loop
        if (self.counter < 3) {
            send(SendParameters{
                to: self.myAddr,
                value: 0,
                bounce: true,
                mode: SendRemainingValue,
                body: Msg{ data: self.counter }.toCell()
            });
        }
    }
}
