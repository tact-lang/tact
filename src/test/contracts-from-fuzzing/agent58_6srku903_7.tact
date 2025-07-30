message MsgTest { value: Int as uint8; }

extends fun double(self: Int): Int {
    return self + self;
}

contract PrimitiveTypesTest() {
    fun test() {
        // Test various integer literal representations
        let a: Int = 1_000;   // decimal literal
        let b: Int = 0xABC;     // hexadecimal literal
        let c: Int = 0o777;     // octal literal
        let d: Int = 0b1010;    // binary literal
        // Dump the sum of all values
        dump(a + b + c + d);
    }
    receive() {
        self.test();
    }
}

contract BuilderSliceTest() {
    fun test() {
        // Build a cell with an unsigned 6-bit int and a signed 7-bit int
        let bb: Builder = beginCell()
            .storeUint(42, 6)
            .storeInt(-42, 7);
        let cellRepresentation: Cell = bb.endCell();
        let sliceRepresentation: Slice = cellRepresentation.asSlice();
        // Extract the 6-bit unsigned int
        let extractedValue: Int = sliceRepresentation.loadUint(6);
        dump(extractedValue);
    }
    receive() {
        self.test();
    }
}

contract MapValidTest() {
    fun test() {
        // Create a map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        // Retrieve and sum values
        let sum: Int = m.get(1)!! + m.get(2)!!;
        dump(sum);
    }
    receive() {
        self.test();
    }
}

contract MessageStructTest() {
    fun test() {
       // Instantiate a message struct and perform round-trip conversion
       let m: MsgTest = MsgTest{ value: 42 };
       let cellRepresentation: Cell = m.toCell();
       let m2: MsgTest = MsgTest.fromCell(cellRepresentation);
       require(m2.value == 42, "Message struct round-trip failed");
       dump(m2.value);
    }
    receive() {
        self.test();
    }
}

contract ExtensionTest() {
   fun test() {
      // Testing the extension function that doubles an integer
      let a: Int = 21;
      dump(a.double()); // Expected to dump 42
   }
   receive() {
      self.test();
   }
}
