contract Twin {
    init(p1: Int, p2: Int) {
        // Simple init, no operations
    }
    receive() {}
}

contract TestTwin {
    receive() {
         // Test valid usage with trailing comma in initOf call
         let si1 = initOf Twin(1, 2,);
         let co1 = codeOf Twin;
    }
}
