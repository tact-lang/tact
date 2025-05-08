contract E {
    init(x: Int, y: Int) {
        // Dummy initialization using parameters x and y
        // It can be expanded to use x and y in some way if needed
    }
    receive() {}
}

contract TestE {
    receive() {
        // Valid usage of initOf with trailing comma in parameters
        let state_e = initOf E(100, 200,);
    }
}
