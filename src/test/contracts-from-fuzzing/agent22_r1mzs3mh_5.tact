// Chain of contracts: A1 -> A2 -> ... -> A10, testing deep nested initOf usage

contract A1() {
    get fun next() : Address {
         return contractAddress(initOf A2());
    }
}

contract A2() {
    get fun next() : Address {
         return contractAddress(initOf A3());
    }
}

contract A3() {
    get fun next() : Address {
         return contractAddress(initOf A4());
    }
}

contract A4() {
    get fun next() : Address {
         return contractAddress(initOf A5());
    }
}

contract A5() {
    get fun next() : Address {
         return contractAddress(initOf A6());
    }
}

contract A6() {
    get fun next() : Address {
         return contractAddress(initOf A7());
    }
}

contract A7() {
    get fun next() : Address {
         return contractAddress(initOf A8());
    }
}

contract A8() {
    get fun next() : Address {
         return contractAddress(initOf A9());
    }
}

contract A9() {
    get fun next() : Address {
         return contractAddress(initOf A10());
    }
}

contract A10() {
    // Final contract with self recursive initOf call
    get fun base() : Address {
         return contractAddress(initOf A10());
    }
}

// A simple contract using computed expressions for initOf parameters
contract Computed(x: Int) {
    get fun getX() : Int {
         return self.x;
    }
}

contract TestComputed() {
    // Uses an arithmetic expression in the initOf call
    get fun test() : Int {
         // The arithmetic (21 + 21) should evaluate to 42
         let addr1: Address = contractAddress(initOf Computed(21 + 21));
         let addr2: Address = contractAddress(initOf Computed(42));
         // Compare the addresses computed from identical parameter values
         if (addr1 == addr2) {
             return 1; // success
         } else {
             return 0; // failure
         }
    }
}
