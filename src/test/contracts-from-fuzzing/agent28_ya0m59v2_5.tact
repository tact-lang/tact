struct Pair {
    first: Int;
    second: Int;
}

contract TestReturnCases {
    
    // Function with explicit multiple return paths: returns optional Int
    fun optTest(x: Bool): Int? {
        if (x) {
            return 10;
        } else {
            return null;
        }
    }
    
    // Regular function with nested conditional returns
    fun multiReturn(x: Int): Int {
        if (x < 0) {
            return -100;
        } else {
            {
                if (x == 0) {
                    return 0;
                } else {
                    return x * 2;
                }
            }
        }
    }
    
    // A state variable
    v: Int = 5;

    // Getter returning a tuple (simulated via a struct) with multiple return paths
    get fun getterPair(): Pair {
        if (self.v % 2 == 0) {
            return Pair { first: self.v, second: self.v + 1 };
        } else {
            return Pair { first: self.v, second: self.v - 1 };
        }
    }
    
    // Receiver function with a return statement in branches
    receive () {
        let x: Int = 42;
        if (x > 50) {
            return;
        } else {
            return;
        }
    }
}
