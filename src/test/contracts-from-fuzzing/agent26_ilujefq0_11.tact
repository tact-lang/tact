fun chainMethodTest2(): Cell {
    // Chaining method calls: Convert an integer to a string, then call asComment()
    // Here, we adjust the return type to Cell because asComment() seems to produce a Cell.
    return 789.toString().asComment();
}

contract ChainMethodTest2 {
    receive() {
        chainMethodTest2();
    }
}
