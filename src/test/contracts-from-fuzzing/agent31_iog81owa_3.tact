contract A {
    receive("a") {
        let bInit = initOf B();
        let bAddr = contractAddress(bInit);
        return;
    }
}

contract B {
    receive("b") {
        let cInit = initOf C();
        let cAddr = contractAddress(cInit);
        return;
    }
}

contract C {
    receive("c") {
        let aInit = initOf A();
        let aAddr = contractAddress(aInit);
        return;
    }
}
