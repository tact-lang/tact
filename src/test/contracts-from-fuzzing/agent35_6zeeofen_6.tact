contract X {
    init() {
        // cyclic dependency: X calls initOf Y
        let yInit = initOf Y();
        let addrY = contractAddress(yInit);
    }
}

contract Y {
    init() {
        // cyclic dependency: Y calls initOf X
        let xInit = initOf X();
        let addrX = contractAddress(xInit);
    }
}
