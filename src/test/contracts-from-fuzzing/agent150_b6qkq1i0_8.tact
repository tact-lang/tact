contract C {
    init(x: Int, y: Int) {
         // Parameters are used but no storage is present
         // (this is a minimal test for parameterized init)
         let sum = x + y;
    }
    receive() {}
}

contract TestC {
    receive() {
         // Valid usage with proper arguments
         let s = initOf C(10, 20);
         let c = codeOf C;

         // Uncommenting the following line should result in a compilation error due to wrong number of arguments
         // let s_error = initOf C(10);
    }
}
