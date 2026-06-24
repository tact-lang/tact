struct One { number: Int; }

message TestMsg { val: Int as uint8; }

struct OptStruct { opt: Int?; }

// Test 1: Valid usage of optional non-null assertion
contract TestOptionalValid {
    receive() {
        let opt: Int? = null;
        opt = 100;
        // Using non-null assertion on an optional variable
        dump(opt!!); // Expected output: 100
    }
}

// Test 2: Ensure that non-null assertion on non-optional types is rejected (this contract should not be deployable in production)
// We'll comment out the offending line to allow compilation, but note that uncommenting it should fail.
contract TestNonNullOnNonOptional {
    receive() {
        let a: Int = 10;
        // The following line would produce a compilation error if uncommented, as 'a' is not optional:
        // let b = a!!;
        dump(a); // Expected output: 10
    }
}

// Test 3: Struct conversion to and from Cell
contract TestStructConversions {
    receive() {
        let one: One = One{ number: 50 };
        let cell = one.toCell();
        let one2 = One.fromCell(cell);
        dump(one2.number); // Expected output: 50
    }
}

// Test 4: Message struct conversion to and from Cell
contract TestMessageConversion {
    receive() {
        let m: TestMsg = TestMsg{ val: 42 };
        let cell = m.toCell();
        let m2 = TestMsg.fromCell(cell);
        dump(m2.val); // Expected output: 42
    }
}

// Test 5: Map operations: setting, getting, and existence check
contract TestMapOperations {
    receive() {
        let m: map<Int, Bool> = emptyMap();
        m.set(1, true);
        dump(m.get(1)!!); // Expected output: true
    }
}

// Test 6: Struct with an optional field
contract TestStructOptional {
    receive() {
        let s: OptStruct = OptStruct{ opt: null };
        if (s.opt == null) {
            dump(0); // Expected output: 0
        } else {
            dump(s.opt!!);
        }
    }
}

// Test 7: Address manipulation and StdAddress extraction
contract TestAddress {
    receive() {
        let addr: Address = myAddress();
        let st: StdAddress = parseStdAddress(addr.asSlice());
        dump(st.workchain); // Expected output: 0 (commonly the basechain)
    }
}

// Test 8: Conversion of a string literal to a Cell and obtaining its Slice
contract TestCellSlice {
    receive() {
        let c: Cell = "hello".asComment();
        let s: Slice = c.asSlice();
        // Dump the number of bits in the slice; exact value depends on the asComment implementation
        dump(s.bits());
    }
}

// Test 9: Builder usage to create a Cell and then parse it
contract TestBuilder {
    receive() {
        let bb: Builder = beginCell().storeUint(5, 3);
        let cell = bb.endCell();
        let slice = cell.asSlice();
        let v = slice.loadUint(3);
        dump(v); // Expected output: 5
    }
}
