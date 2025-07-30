struct Tup {
    a: Int;
    b: String;
}

contract FuzzReturnAdvanced {
    // Function returning a tuple with multiple nested returns
    fun tupleConditional(flag: Bool, x: Int): Tup {
        if (flag) {
            { return Tup{ a: x, b: "yes" }; }
        }
        { return Tup{ a: x + 1, b: "no" }; }
    }
    
    // Function with continuous nested blocks returning a tuple in one branch and not in the other
    fun nestedTuple(x: Int): Tup {
        if (x > 0) {
            {
                { return Tup{ a: x, b: "positive" }; }
            }
        } else {
            return Tup{ a: x, b: "non-positive" };
        }
    }
    
    // Getter returning a tuple type using nested blocks, reading state
    v: Int = 50;
    get fun getTuple(): Tup {
        { return Tup{ a: self.v, b: "state" }; }
    }
}
