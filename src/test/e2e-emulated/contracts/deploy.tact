message DeployParamsMsg {
    mode: Int as uint8;
    bounce: Bool;
    contractNum: Int;
    body: Slice as remaining;
}

message DeployComparisonMsg {
    mode: Int as uint8;
    bounce: Bool;
    contractNum: Int;
    value: Int as coins;
    body: Slice as remaining;
}

message DeployComparisonNoBodyMsg {
    mode: Int as uint8;
    bounce: Bool;
    contractNum: Int;
    value: Int as coins;
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

    // In this test we do not care if the contracts are already deployed,
    // what we really want to check is that both functions "send" and "deploy"
    // produce indistinguishable messages.
    receive(msg: DeployComparisonMsg) {
        let initInfo = initOf DeployContract(msg.contractNum);
        deploy(DeployParameters{
            mode: msg.mode,
            body: msg.body.asCell(),
            value: msg.value,
            bounce: msg.bounce,
            init: initInfo
        });
        send(SendParameters{
            mode: msg.mode,
            body: msg.body.asCell(),
            code: initInfo.code,
            data: initInfo.data,
            value: msg.value,
            bounce: msg.bounce,
            to: contractAddress(initInfo)
        });
    }

    // Do the same, but with no body, since it is the only 
    // optional parameter common to both functions.
    receive(msg: DeployComparisonNoBodyMsg) {
        let initInfo = initOf DeployContract(msg.contractNum);
        deploy(DeployParameters{
            mode: msg.mode,
            value: msg.value,
            bounce: msg.bounce,
            init: initInfo
        });
        send(SendParameters{
            mode: msg.mode,
            code: initInfo.code,
            data: initInfo.data,
            value: msg.value,
            bounce: msg.bounce,
            to: contractAddress(initInfo)
        });
    }
}