contract B {
    init() {}
}

contract A {
    init() {
        let pkg = initOf B();
        let addr = contractAddress(pkg);
    }
}
