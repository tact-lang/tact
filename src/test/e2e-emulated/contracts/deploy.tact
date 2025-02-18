message DeployParamsMsg {
    mode: Int as uint8;
    bounce: Bool;
    contractNum: Int;
    body: Slice as remaining;
}

contract DeployContract {
    internalNum: Int;
    
    init(newNum: Int) {
        self.internalNum = newNum;
    }
    receive(msg: Slice) {

    }
    receive(msg: DeployParamsMsg) {
        deploy(DeployParameters{
            mode: msg.mode,
            body: msg.body.asCell(),
            value: 0,
            bounce: msg.bounce,
            init: initOf DeployContract(msg.contractNum)
        });
    }
}