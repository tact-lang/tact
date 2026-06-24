contract A {
    init() {
        let bInit = initOf B();
        let bAddr = contractAddress(bInit);
    }
}

contract B {
    init() {
        let aInit = initOf A();
        let aAddr = contractAddress(aInit);
    }
}
