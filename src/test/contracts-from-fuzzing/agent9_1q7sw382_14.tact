trait BaseGetter {
    // Trait's persistent state variable, to be provided by the implementing contract
    id: Int;
    
    // Getter to retrieve id
    get fun getId(): Int { 
        return self.id;
    }
}

contract TestGetter2 with BaseGetter {
    // Persistent state variables
    id: Int;
    x: Int = 10;

    // Initialization of state must be performed in init()
    init(id: Int) {
        self.id = id;
    }

    receive() {}

    // New getter with two parameters that multiplies the inputs
    get fun multiply(a: Int, b: Int): Int {
        return a * b;
    }

    // Parameterized getter that conditionally returns an optional value
    get fun maybeDivide(a: Int, b: Int): Int? {
        if (b != 0) {
            return a / b;
        } else {
            return null;
        }
    }
}
