contract BasicInit {
    init() {}
    receive() {}
}

contract Caller {
    receive() {
         let st = initOf BasicInit();
         let c = codeOf BasicInit;
    }
}
