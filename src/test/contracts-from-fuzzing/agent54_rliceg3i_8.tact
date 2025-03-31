contract E {
    init(x: Int, y: Int) {
        // simple initialization
    }
    receive() {}
}

contract TestE {
    receive() {
        // Valid usage with trailing comma in parameter list
        let e_init = initOf E(1, 2,);
        let e_code = codeOf E;
    }
}
