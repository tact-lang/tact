import "deployer.tact";

fun fun_0(arg: Int): StateInit {
    let stateInit: StateInit = initOf Deployer();
    return stateInit;
}

fun fun_1(arg: Int): StateInit {
    let stateInit: StateInit = initOf Deployer();
    return stateInit;
}

fun fun_2(arg: Int): StateInit {
    let stateInit: StateInit = fun_0(arg);
    return stateInit;
}

contract Expr_StaticCall_Let_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        fun_2(arg);
    }

    receive() { }
}