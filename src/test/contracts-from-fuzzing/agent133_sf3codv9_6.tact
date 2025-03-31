contract C {}

contract Test2 {
    receive() {}
    get fun testInit(): Cell {
         return initOf C().code;
    }
}
