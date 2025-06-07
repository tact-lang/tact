contract TestDeploySend {
    receive() {
        let init_pkg = initOf Dummy();
        send(SendParameters{
            to: contractAddress(init_pkg),
            value: ton("1"),
            mode: SendIgnoreErrors, // using flag to ignore errors
            code: init_pkg.code,
            data: init_pkg.data,
            body: "init message".asComment()
        });
        cashback(sender());
    }
}

contract Dummy() {}