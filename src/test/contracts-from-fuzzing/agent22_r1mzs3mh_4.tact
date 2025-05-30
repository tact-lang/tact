contract GrandChild(x: Int) {
    // returns the parameter x stored in contract parameter
    get fun getX() : Int {
       return self.x;
    }
}

contract Child(a: Int) {
    // Uses initOf for GrandChild with parameter a
    get fun childToGrand(): Address {
       return contractAddress(initOf GrandChild(self.a));
    }
}

contract Parent() {
    // Uses initOf for Child with parameter 42
    get fun parentToChild(): Address {
       return contractAddress(initOf Child(42));
    }
}

contract A() {
    // Mutual recursion: uses initOf for B
    get fun addrB(): Address {
         return contractAddress(initOf B());
    }
}

contract B() {
    // Mutual recursion: uses initOf for A
    get fun addrA(): Address {
         return contractAddress(initOf A());
    }
}

contract ParamTest(x: Int, y: Int,) {
    // Simple getter that sums the parameters
    get fun sum(): Int {
       return self.x + self.y;
    }
}

contract SelfRecursive() {
    // Self reference using initOf on itself
    get fun selfAddr(): Address {
         return contractAddress(initOf SelfRecursive());
    }
}
