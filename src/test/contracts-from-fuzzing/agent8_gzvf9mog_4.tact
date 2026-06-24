/// Test 4: Using initOf in a getter function to obtain a child contract's init package
contract Child {
    init(x: Int) {
        // Child contract init logic
    }
}

contract Parent {
    // Getter function, using initOf for Child
    get fun childCode() : Cell {
       let s: StateInit = initOf Child(55);
       return s.code;
    }
}
