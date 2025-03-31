contract Y {
    init(a: Int) {
        // Initializes contract Y with an integer parameter
    }
    receive() {}
}

contract Z {
    init(flag: Bool) {
        // Initializes contract Z with a boolean parameter
    }
    receive() {}
}

contract X {
    init(x: Int) {
        // Demonstrate multiple initOf usages with arithmetic and boolean expressions in parameters
        let sY: StateInit = initOf Y(x * 2);
        let sZ: StateInit = initOf Z(x > 10);
    }
    receive() {}
}
