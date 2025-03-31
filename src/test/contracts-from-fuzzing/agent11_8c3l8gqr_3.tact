/// Test 1: Multi-level parent-child-grandchild chain
contract Grandchild {
    init() {}
}

contract Child {
    init() {
         let initG = initOf Grandchild();
    }
}

contract Parent {
    receive() {
         let initC = initOf Child();
         let initG = initOf Grandchild();
    }
}
