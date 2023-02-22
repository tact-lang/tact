contract A {

    init() {

    }

    receive("Message") {
        let init: StateInit = initOf B(myAddress());
        let address: Address = contractAddress(init);
        send(SendParameters{
            value: 0, 
            to: address, 
            mode: SendRemainingValue + SendIgnoreErrors, 
            bounce: true,
            code: init.code,
            data: init.data,
            body: "Message".asComment()
        });
    }

    get fun getNext(): StateInit {
        return initOf B(myAddress());
    }
}

contract B {
    parent: Address;
    init(parent: Address) {
        self.parent = parent;
    }

    receive("Message") {
        let init: StateInit = initOf C(myAddress());
        let address: Address = contractAddress(init);
        send(SendParameters{
            value: 0, 
            to: address, 
            mode: SendRemainingValue + SendIgnoreErrors, 
            bounce: true,
            code: init.code,
            data: init.data,
            body: "Message".asComment()
        });
    }

    get fun getNext(): StateInit {
        return initOf C(myAddress());
    }
}

contract C {
    parent: Address;
    init(parent: Address) {
        self.parent = parent;
    }

    receive("Message") {
        let init: StateInit = initOf C(self.parent);
        let address: Address = contractAddress(init);
        send(SendParameters{
            value: 0, 
            to: address, 
            mode: SendRemainingValue + SendIgnoreErrors, 
            bounce: true,
            code: init.code,
            data: init.data,
            body: "Message2".asComment()
        });
    }

    receive("Message2") {
        // Nothing to do
    }
}