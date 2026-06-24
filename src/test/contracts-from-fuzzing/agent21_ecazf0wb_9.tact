struct TupleWrapper {
    a: Int;
    b: Int;
}

contract Test {
    // Regular function with explicit return
    fun test1(): Int {
       return 42;
    }

    // Regular function with conditional returns
    fun test2(val: Bool): Int {
       if (val) { return 1; }
       return 0;
    }

    // Return from nested block in a regular function
    fun nestedBlockReturn(): Int {
        {
            if(true) { return 7; }
        }
        return 0;
    }

    // Receiver with return (empty return since receivers don't return a value)
    receive(msg: Slice) {
        return;
    }

    // Getter function with basic return
    get fun getterValue(): Int {
        return 10;
    }

    // Getter with conditional return using a Struct for tuple-like behavior
    get fun getterTuple(): TupleWrapper {
         if (true) { return TupleWrapper { a: 1, b: 2 }; }
         return TupleWrapper { a: 3, b: 4 }; 
    }
}
