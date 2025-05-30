struct TupleRes {
    first: Int;
    second: Bool;
}

contract Test {
    // Test variable for primitive getter
    value: Int = 10;

    // Map variable for testing non-existent key getter
    m: map<Int, Int>;

    // Getter 1: Returns an Int primitive
    get fun getValue(): Int {
        return self.value;
    }

    // Getter 2: Returns a composite type (struct TupleRes)
    get fun getTupleRes(): TupleRes {
        return TupleRes { first: 42, second: true };
    }

    // Getter 3: Accesses a map and returns an optional Int
    get fun getNonExistentKey(): Int? {
         return self.m.get(100);
    }

    // Getter 4: Computes and returns a Cell at runtime
    get fun getCell(): Cell {
        let b = beginCell().storeUint(42, 8);
        return b.endCell();
    }

    // Getter 5: Modifies internal state (modification not persisted after execution)
    get fun getAndModify(): Int {
        self.value += 5;
        return self.value;
    }

    // Getter 6: Returns a Slice computed from a runtime-created Cell
    get fun getSlice(): Slice {
        let c = beginCell().storeUint(123, 8).endCell();
        return c.beginParse();
    }

    receive() {}
}
