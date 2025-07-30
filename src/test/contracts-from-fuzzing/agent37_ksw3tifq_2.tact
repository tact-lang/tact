contract Grandchild {}

contract Child {
    init() {
        // Initialize Grandchild in Child's init
        let gc = initOf Grandchild();
    }
}

contract Parent {
    init() {
        // Initialize Child in Parent's init
        let child_state = initOf Child();
    }
}
