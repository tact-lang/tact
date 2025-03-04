
fun fun_0(arg: Int): StateInit {
    return initOf Deployer();
}

fun fun_9(arg: Int): StateInit {
    let stateInit: StateInit = initOf Deployer();
    return stateInit;
}

fun fun_10(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg == 0) {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_11(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg == 0) {
        stateInit = initOf Deployer();
    } else {
        stateInit = initOf Dummy2();
    }
    return stateInit;
}

fun fun_12(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg + 1 == 0) {
        stateInit = initOf Dummy2();
    } else {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_13(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = arg - arg;
    while (counter <= 2) {
        stateInit = initOf Deployer();
        counter = counter + 1;
    }
    return stateInit;
}

fun fun_14(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = arg - arg;
    do {
        stateInit = initOf Deployer();
        counter = counter + 1;
    } until (counter >= 2);
    return stateInit;
}

fun fun_15(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = random(1, 3);
    repeat (counter) {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_16(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let intMap: map<Int,Int> = null;
    intMap.set(1, 3);
    foreach (v_1, v_2 in intMap) {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_17(arg: Int): StateInit {
    let StateInitWrapper {init: stateInit} = StateInitWrapper{init: initOf Deployer()};
    return stateInit;
}

fun fun_18(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_19(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    try {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_20(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    try {
        1 / (arg - arg);
    } catch (v_4) {
        stateInit = initOf Deployer();
    }
    return stateInit;
}

fun fun_21(arg: Int): StateInit {
    let stateInit: StateInit = fun_0(arg);
    return stateInit;
}

fun fun_22(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg == 0) {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_23(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg == 0) {
        stateInit = fun_0(arg);
    } else {
        stateInit = initOf Dummy2();
    }
    return stateInit;
}

fun fun_24(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    if (arg - arg + 1 == 0) {
        stateInit = initOf Dummy2();
    } else {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_25(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = arg - arg;
    while (counter <= 2) {
        stateInit = fun_0(arg);
        counter = counter + 1;
    }
    return stateInit;
}

fun fun_26(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = arg - arg;
    do {
        stateInit = fun_0(arg);
        counter = counter + 1;
    } until (counter >= 2);
    return stateInit;
}

fun fun_27(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let counter: Int = random(1, 3);
    repeat (counter) {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_28(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    let intMap: map<Int,Int> = null;
    intMap.set(1, 3);
    foreach (v_5, v_6 in intMap) {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_29(arg: Int): StateInit {
    let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_0(arg)};
    return stateInit;
}

fun fun_30(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_31(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    try {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

fun fun_32(arg: Int): StateInit {
    let stateInit: StateInit = initOf Dummy1();
    try {
        1 / (arg - arg);
    } catch (v_8) {
        stateInit = fun_0(arg);
    }
    return stateInit;
}

contract Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Deployer();
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Deployer();
    }

    receive() { }
}

contract Expr_InitOf_NoSend {
    init(arg: Int) {
        initOf Deployer();
    }

    receive() { }
}

contract IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = initOf Deployer();
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = initOf Deployer();
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = initOf Deployer();
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = initOf Deployer();
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = initOf Deployer();
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = initOf Deployer();
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_33, v_34 in intMap) {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_33, v_34 in intMap) {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract Destruct_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: initOf Deployer()};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: initOf Deployer()};
    }

    receive() { }
}

contract Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_36) {
            stateInit = initOf Deployer();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_36) {
            stateInit = initOf Deployer();
        }
    }

    receive() { }
}

contract Let_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_9(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_9(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        fun_9(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_9(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_9(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_9(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_9(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_9(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_9(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_37, v_38 in intMap) {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_37, v_38 in intMap) {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Let_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_9(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_9(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Let_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_40) {
            stateInit = fun_9(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Let_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_40) {
            stateInit = fun_9(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_10(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_10(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        fun_10(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_10(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_10(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_10(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_10(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_10(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_10(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_41, v_42 in intMap) {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_41, v_42 in intMap) {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_10(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_10(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfNoElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_44) {
            stateInit = fun_10(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfNoElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_44) {
            stateInit = fun_10(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_11(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_11(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        fun_11(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_11(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_11(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_11(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_11(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_11(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_11(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_45, v_46 in intMap) {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_45, v_46 in intMap) {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_11(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_11(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfThen_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_48) {
            stateInit = fun_11(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfThen_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_48) {
            stateInit = fun_11(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_12(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_12(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        fun_12(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_12(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_12(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_12(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_12(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_12(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_12(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_49, v_50 in intMap) {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_49, v_50 in intMap) {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_12(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_12(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfElse_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_52) {
            stateInit = fun_12(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfElse_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_52) {
            stateInit = fun_12(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_13(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_13(arg);
    }

    receive() { }
}

contract Expr_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        fun_13(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_13(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_13(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_13(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_13(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_13(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_13(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_53, v_54 in intMap) {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_53, v_54 in intMap) {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_While_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_13(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_13(arg)};
    }

    receive() { }
}

contract Block_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_While_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_56) {
            stateInit = fun_13(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_While_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_56) {
            stateInit = fun_13(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_14(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_14(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        fun_14(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_14(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_14(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_14(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_14(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_14(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_14(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_57, v_58 in intMap) {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_57, v_58 in intMap) {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Until_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_14(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_14(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Until_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_60) {
            stateInit = fun_14(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Until_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_60) {
            stateInit = fun_14(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_15(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_15(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        fun_15(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_15(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_15(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_15(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_15(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_15(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_15(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_61, v_62 in intMap) {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_61, v_62 in intMap) {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_15(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_15(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Repeat_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_64) {
            stateInit = fun_15(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Repeat_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_64) {
            stateInit = fun_15(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_16(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_16(arg);
    }

    receive() { }
}

contract Expr_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        fun_16(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_16(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_16(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_16(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_16(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_16(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_16(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_65, v_66 in intMap) {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_65, v_66 in intMap) {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_16(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_16(arg)};
    }

    receive() { }
}

contract Block_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_ForEach_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_68) {
            stateInit = fun_16(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_ForEach_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_68) {
            stateInit = fun_16(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_17(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_17(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        fun_17(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_17(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_17(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_17(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_17(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_17(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_17(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_69, v_70 in intMap) {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_69, v_70 in intMap) {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_17(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_17(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Destruct_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_72) {
            stateInit = fun_17(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Destruct_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_72) {
            stateInit = fun_17(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_18(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_18(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        fun_18(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_18(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_18(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_18(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_18(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_18(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_18(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_73, v_74 in intMap) {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_73, v_74 in intMap) {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Block_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_18(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_18(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Block_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_76) {
            stateInit = fun_18(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Block_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_76) {
            stateInit = fun_18(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_19(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_19(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        fun_19(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_19(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_19(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_19(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_19(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_19(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_19(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_77, v_78 in intMap) {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_77, v_78 in intMap) {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Try_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_19(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_19(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Try_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_80) {
            stateInit = fun_19(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Try_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_80) {
            stateInit = fun_19(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = fun_20(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_20(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        fun_20(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_20(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_20(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_20(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_20(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_20(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_20(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_81, v_82 in intMap) {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_81, v_82 in intMap) {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_20(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_20(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Catch_InitOf {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_84) {
            stateInit = fun_20(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Catch_InitOf_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_84) {
            stateInit = fun_20(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_21(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_21(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        fun_21(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_21(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_21(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_21(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_21(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_21(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_21(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_85, v_86 in intMap) {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_85, v_86 in intMap) {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_21(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_21(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Let_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_88) {
            stateInit = fun_21(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Let_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_88) {
            stateInit = fun_21(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_22(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_22(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        fun_22(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_22(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_22(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_22(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_22(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_22(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_22(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_89, v_90 in intMap) {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_89, v_90 in intMap) {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_22(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_22(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfNoElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_92) {
            stateInit = fun_22(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfNoElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_92) {
            stateInit = fun_22(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_23(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_23(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        fun_23(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_23(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_23(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_23(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_23(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_23(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_23(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_93, v_94 in intMap) {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_93, v_94 in intMap) {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_23(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_23(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfThen_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_96) {
            stateInit = fun_23(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfThen_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_96) {
            stateInit = fun_23(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_24(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_24(arg);
    }

    receive() { }
}

contract Expr_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        fun_24(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_24(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_24(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_24(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_24(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_24(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_24(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_97, v_98 in intMap) {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_97, v_98 in intMap) {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_24(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_24(arg)};
    }

    receive() { }
}

contract Block_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_IfElse_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_100) {
            stateInit = fun_24(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_IfElse_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_100) {
            stateInit = fun_24(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_25(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_25(arg);
    }

    receive() { }
}

contract Expr_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        fun_25(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_25(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_25(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_25(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_25(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_25(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_25(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_101, v_102 in intMap) {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_101, v_102 in intMap) {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_While_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_25(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_25(arg)};
    }

    receive() { }
}

contract Block_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_While_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_104) {
            stateInit = fun_25(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_While_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_104) {
            stateInit = fun_25(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_26(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_26(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        fun_26(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_26(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_26(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_26(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_26(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_26(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_26(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_105, v_106 in intMap) {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_105, v_106 in intMap) {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_26(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_26(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Until_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_108) {
            stateInit = fun_26(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Until_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_108) {
            stateInit = fun_26(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_27(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_27(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        fun_27(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_27(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_27(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_27(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_27(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_27(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_27(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_109, v_110 in intMap) {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_109, v_110 in intMap) {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_27(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_27(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Repeat_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_112) {
            stateInit = fun_27(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Repeat_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_112) {
            stateInit = fun_27(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_28(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_28(arg);
    }

    receive() { }
}

contract Expr_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        fun_28(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_28(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_28(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_28(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_28(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_28(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_28(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_113, v_114 in intMap) {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_113, v_114 in intMap) {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_28(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_28(arg)};
    }

    receive() { }
}

contract Block_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_ForEach_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_116) {
            stateInit = fun_28(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_ForEach_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_116) {
            stateInit = fun_28(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_29(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_29(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        fun_29(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_29(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_29(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_29(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_29(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_29(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_29(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_117, v_118 in intMap) {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_117, v_118 in intMap) {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_29(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_29(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Destruct_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_120) {
            stateInit = fun_29(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Destruct_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_120) {
            stateInit = fun_29(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_30(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_30(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        fun_30(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_30(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_30(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_30(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_30(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_30(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_30(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_121, v_122 in intMap) {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_121, v_122 in intMap) {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_30(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_30(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Block_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_124) {
            stateInit = fun_30(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Block_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_124) {
            stateInit = fun_30(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_31(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_31(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        fun_31(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_31(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_31(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_31(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_31(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_31(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_31(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_125, v_126 in intMap) {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_125, v_126 in intMap) {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_31(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_31(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Try_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_128) {
            stateInit = fun_31(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Try_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_128) {
            stateInit = fun_31(arg);
        }
    }

    receive() { }
}

contract Let_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = fun_32(arg);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Let_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = fun_32(arg);
    }

    receive() { }
}

contract Expr_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        fun_32(arg);
    }

    receive() { }
}

contract IfNoElse_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfNoElse_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract IfThen_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_32(arg);
        } else {
            stateInit = initOf Dummy2();
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfThen_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg == 0) {
            stateInit = fun_32(arg);
        } else {
            stateInit = initOf Dummy2();
        }
    }

    receive() { }
}

contract IfElse_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract IfElse_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        if (arg - arg + 1 == 0) {
            stateInit = initOf Dummy2();
        } else {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract While_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_32(arg);
            counter = counter + 1;
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract While_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        while (counter <= 2) {
            stateInit = fun_32(arg);
            counter = counter + 1;
        }
    }

    receive() { }
}

contract Until_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_32(arg);
            counter = counter + 1;
        } until (counter >= 2);
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Until_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = arg - arg;
        do {
            stateInit = fun_32(arg);
            counter = counter + 1;
        } until (counter >= 2);
    }

    receive() { }
}

contract Repeat_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Repeat_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let counter: Int = random(1, 3);
        repeat (counter) {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract ForEach_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_129, v_130 in intMap) {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract ForEach_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        let intMap: map<Int,Int> = null;
        intMap.set(1, 3);
        foreach (v_129, v_130 in intMap) {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract Destruct_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_32(arg)};
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Destruct_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let StateInitWrapper {init: stateInit} = StateInitWrapper{init: fun_32(arg)};
    }

    receive() { }
}

contract Block_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Block_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract Try_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Try_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

contract Catch_StaticCall_Catch_StaticCall {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_132) {
            stateInit = fun_32(arg);
        }
        let addr: Address = contractAddress(stateInit);
        send(SendParameters{to: addr, value: ton("1")});
    }

    receive() { }
}

contract Catch_StaticCall_Catch_StaticCall_NoSend {
    init(arg: Int) {
        let stateInit: StateInit = initOf Dummy1();
        try {
            1 / (arg - arg);
        } catch (v_132) {
            stateInit = fun_32(arg);
        }
    }

    receive() { }
}

message DeployMessage {
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
