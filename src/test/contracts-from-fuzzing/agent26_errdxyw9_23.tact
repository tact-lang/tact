struct DeepGraphState {
    a: StateInit;
    b: StateInit;
    c: StateInit;
    d: StateInit;
    e: StateInit;
}

contract E {
    init(x: Int) { }
}

contract D {
    init(x: Int) { }
}

contract C {
    init(x: Int) { }
}

contract B {
    init(x: Int) { }
}

contract A {
    init(x: Int) { }
}

contract DeepGraph {
    fun deepChain() : DeepGraphState {
         return DeepGraphState{
             a: initOf A(1),
             b: initOf B(2),
             c: initOf C(3),
             d: initOf D(4),
             e: initOf E(5)
         };
    }
}
