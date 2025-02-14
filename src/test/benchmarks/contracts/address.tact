contract Addresses {
    receive() { }

    init() {}

    get fun contractAddressExt(): Address {
        let stateInit = initOf Addresses();
        return contractAddressExt(0, stateInit.code, stateInit.data);
    }
}
