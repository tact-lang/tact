contract SimpleB {
    // no explicit init
}

contract SimpleA {
    receive() {
        let s: StateInit = initOf SimpleB();
    }
}

contract ParamD(t: Int) {
    // implicit empty init; cannot declare init() with contract parameters
}

contract ParamE {
    receive() {
        let s: StateInit = initOf ParamD(42);
    }
}

contract C2 {
    // empty contract for multi-level chain
}

contract B2 {
    receive() {
        let s: StateInit = initOf C2();
    }
}

contract A2 {
    receive() {
        let s: StateInit = initOf B2();
    }
}

contract RecursiveR {
    receive() {
        let s: StateInit = initOf RecursiveR();
    }
}

contract CyclicA {
    receive() {
        let s: StateInit = initOf CyclicB();
    }
}

contract CyclicB {
    receive() {
        let s: StateInit = initOf CyclicA();
    }
}
