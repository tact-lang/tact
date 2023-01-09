contract A {
    a: Int = 0;
    init() {

    }

    receive("Message") {
        let init: StateInit = initOf B();
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
}

contract B {
    a: Int = 0;
    init() {

    }

    receive("Message") {
        let init: StateInit = initOf C();
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
}

contract C {
    a: Int = 0;
    init() {

    }

    receive("Message") {
        
    }
}