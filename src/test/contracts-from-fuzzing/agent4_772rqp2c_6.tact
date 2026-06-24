contract Dummy2() {}

contract TestSendDeploy() {
    receive() {
        let init = initOf Dummy2();
        send(SendParameters{
            to: contractAddress(init),
            value: ton("0.1"),
            mode: SendIgnoreErrors,
            code: init.code,
            data: init.data,
            body: "Deploying Dummy2".asComment()
        });
    }
}
