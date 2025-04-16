contract X {
    init() {
         let yPkg = initOf Y();
         let yAddr = contractAddress(yPkg);
    }
}

contract Y {
    init() {
         let zPkg = initOf Z();
         let zAddr = contractAddress(zPkg);
    }
}

contract Z {
    init() {
         let xPkg = initOf X();
         let xAddr = contractAddress(xPkg);
    }
}
