// Test case 1: Getter returning a primitive value (Int)
contract TestPrimitive {
    value: Int = 123;
    receive() {}
    
    get fun getValue(): Int {
        return self.value;
    }
}

// Test case 2: Getter returning a custom struct
struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    receive() {}

    get fun getPair(): Pair {
        return Pair{ a: 10, b: 20 };
    }
}

// Test case 3: Getter that accesses a map (using .get for safety)
contract TestMapLookup {
    m: map<Int, Int>;
    
    receive() {}
    
    get fun lookup(key: Int): Int {
        // Force assertion that key exists, for fuzzing error conditions if not
        return self.m.get(key)!!;
    }
}

// Test case 4: Getter returning a nested optional struct
struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestNested {
    value: Outer;
    
    init() {
        self.value = Outer{ inner: null };
    }
    
    receive() {}
    
    get fun getOuter(): Outer {
        return self.value;
    }
}

// Test case 5: Getter converting a cell to a slice (requires state initialization in init)
contract TestSliceGetter {
    data: Cell;

    init() {
         // Since constant evaluation of endCell() is not permitted in state definitions,
         // we assign the cell in the init() function.
         self.data = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
         return self.data.beginParse();
    }
}

// Test case 6: Getter that modifies state variable within getter
contract TestGetterMod {
    a: Int = 0;
    
    receive() {}
    
    // While getters are intended to be read-only externally, they can include modifications
    // in their body which will not persist after execution.
    get fun inc(): Int {
        self.a += 1;
        return self.a;
    }
}

// Test case 7: Getter returning an optional value from a map lookup
contract TestOptional {
    m: map<Int, Int>;
    
    receive() {}
    
    get fun optLookup(key: Int): Int? {
        return self.m.get(key);
    }
}
