// This collection of Tact contracts tests various aspects of getter functions behavior.
// Each snippet is isolated to test a single aspect of getter declarations, as described in the Tact documentation.

// 1. Getter returning a primitive value (Int)
contract SimpleGetter {
    x: Int = 42;

    receive() {}

    // Returns a primitive Int
    get fun getX(): Int {
        return self.x;
    }
}

// 2. Getter returning a composite type (Struct)
struct AB { a: Int; b: Bool; }

contract CompositeGetter {
    a: AB = AB{ a: 42, b: true };

    receive() {}

    // Returns a composite struct
    get fun getAB(): AB {
        return self.a;
    }
}

// 3. Getter returning a map type
contract MapGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Returns a map; note that maps can be used off-chain to inspect contract state
    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}

// 4. Getter returning a Slice from a Cell
contract SliceGetter {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    // Returns a Slice parsed from a cell
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}

// 5. Getter returning an optional composite type
struct MyStruct { a: Int; }

contract OptionalGetter {
    s: MyStruct? = null;

    receive() {}

    // Returns an optional; this is useful for cases where the state might be absent
    get fun getS(): MyStruct? {
        return self.s;
    }
}

// 6. Getter test for non-existent map key lookup
contract NonExistentMapGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    // Attempts to retrieve a value for a key that doesn't exist in the map.
    // Expected behavior is to return null (as per getter function semantics when using map.get(key)).
    get fun getNonExistent(): Int? {
        return self.m.get(10);
    }
}

// 7. Getter declared but not used in any receiver calls
contract UnusedGetter {
    x: Int = 5;

    receive() {}

    // A getter that is declared but not explicitly executed elsewhere (reflects off-chain accessible state).
    get fun unused(): Int {
        return self.x;
    }
}

// ---------------------------------------------------------------------
// Summary:
// Each of these isolated test cases compiles successfully.
// They validate that getter functions in Tact:
//   - Support returning primitive and composite types as documented
//   - Correctly handle optional types and accessing map values (including missing keys, which return null)
//   - Can be declared without being actively called by on-chain logic
//   - Perform constant initialization where required (using init() when necessary)
// According to the Tact documentation (see Getter Functions section in docs_book_contracts.md  ), these behaviors align with expectations.
