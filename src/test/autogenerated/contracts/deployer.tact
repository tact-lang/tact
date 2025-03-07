message(100) DeployMessage {
    addr: Address;
    data: Cell;
    code: Cell;
}

struct StateInitWrapper {
    init: StateInit;
}

contract Dummy1 { }

contract Dummy2 { }

contract Deployer {
    receive(msg: DeployMessage) {
        let addr = msg.addr;
        let data = msg.data;
        let code = msg.code;
        send(SendParameters{to: addr, bounce: false, value: ton("10"), data: data, code: code});
    }
}