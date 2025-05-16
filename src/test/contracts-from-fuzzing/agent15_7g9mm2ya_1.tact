contract B {
    init(x: Int) {}
}

contract A {
    // Simple cross-contract initialization: retrieve code from B's initial state
    get fun initBCode() : Cell {
       return initOf B(42).code;
    }
}
