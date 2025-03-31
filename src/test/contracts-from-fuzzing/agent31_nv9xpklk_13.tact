// The following Tact code tests various getter function scenarios for Tact contracts.
// 1. Simple getter returning primitive value:
contract SimpleGetter {
    x: Int = 42;
    
    receive() {}
    
    get fun getX(): Int {
        return self.x;
    }
}

// 2. Getter returning a composite struct:
struct AB { a: Int; b: Bool; }

contract CompositeGetter {
    a: AB = AB{ a: 42, b: true };

    receive() {}

    get fun getAB(): AB {
        return self.a;
    }
}

// 3. Getter returning a map value (map is correctly declared as map<Int, Int>):
contract MapGetter {
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}

// 4. Getter returning a Slice from a cell.
contract SliceGetter {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 8).endCell();
    }
    
    receive() {}
    
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}

// 5. Getter returning an optional composite type.
struct MyStruct { a: Int; }

contract OptionalGetter {
    s: MyStruct? = null;
    
    receive() {}
    
    get fun getS(): MyStruct? {
        return self.s;
    }
}

// 6. Getter attempting to retrieve a value from a map for a non-existent key (expected to return null).
contract NonExistentMapGetter {
    m: map<Int, Int> = emptyMap();
    
    receive() {}
    
    get fun getNonExistent(): Int? {
        return self.m.get(10);
    }
}

// 7. A getter that is declared but is never explicitly used elsewhere.
contract UnusedGetter {
    x: Int = 5;
    
    receive() {}
    
    get fun unused(): Int {
        return self.x;
    }
}

// These snippets each isolate a distinct aspect of getter functionality:
// - Primitive types
// - Composite types (structs)
// - Map types
// - Slices derived from Cells
// - Optional types
// - Behavior for missing map keys
// - Getters that aren’t actively invoked

// All of these snippets compile individually, confirming that getter declarations, their allowed return types, and expression handling in getters behave as per the Tact documentation.
