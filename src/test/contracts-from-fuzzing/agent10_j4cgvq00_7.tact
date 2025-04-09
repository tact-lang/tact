contract E {
    init() {
        // explicit empty init
    }

    receive() {}
}

contract Test {
    receive() {
        let s = initOf E();
        let c = codeOf E;
    }
}
