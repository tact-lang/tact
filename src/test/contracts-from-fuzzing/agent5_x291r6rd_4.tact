contract ChildA {
    init() {}
}

contract ChildB {
    init() {}
}

contract ParentAB {
    init() {
         let a = contractAddress(initOf ChildA());
         let b = contractAddress(initOf ChildB());
    }
}
