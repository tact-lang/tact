contract Mixed {
    init() {}
}

contract Mixer {
    receive() {
        let s = initOf Mixed();
        let c = codeOf Mixed;
        let addr = contractAddress(s);
    }
}
