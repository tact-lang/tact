contract A {

    init() {

    }

    receive("Message") {
        deploy(DeployParameters{
            init: initOf B(myAddress()),
            value: 0, 
            mode: SendRemainingValue | SendIgnoreErrors,
            bounce: true,
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
        // note this uses `send` and not `deploy` on purpose:
        // to also test this way of deploying contracts
        let init: StateInit = initOf C(myAddress());
        let address: Address = contractAddress(init);
        send(SendParameters{
            value: 0, 
            to: address, 
            mode: SendRemainingValue | SendIgnoreErrors,
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
            mode: SendRemainingValue | SendIgnoreErrors,
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