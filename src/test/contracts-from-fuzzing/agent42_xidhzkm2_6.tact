fun testBlock() {
    { let a: Int = 1; dump(a); } 
    { dump(2) } // block with one statement, semicolon omitted
}

contract Test {
    receive() {
       testBlock();
    }
}
