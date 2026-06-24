message MsBounced {
    dummy: Int;
}

contract HelloWorldModified {
    counter: Int;

    init() {
        self.counter = 0;
    }

    get fun getCounter(): Int {
        return self.counter;
    }

    receive("increment") {
        self.counter = self.counter + 1;
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: MsBounced{dummy: self.counter}.toCell()
        });
    }

    bounced(src: bounced<MsBounced>) {
        self.counter = 0;
    }

    external("hello, it's me") {
        self.counter = 0;
    }
}
