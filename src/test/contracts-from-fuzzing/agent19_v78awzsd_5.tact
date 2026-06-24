/// Test Case 1: Primitive Types
contract TestPrimitive() {
    fun run() {
        // Testing basic arithmetic and boolean operations
        let a: Int = 1 + 1;         // Expect 2
        let b: Int = 3 / 2;         // Expect 1 due to floor division
        let c: Int = 42 - 10;       // Expect 32
        let flag: Bool = true && false; // Expect false

        // Testing cell operations
        let cell: Cell = beginCell()
            .storeUint(7, 3)  // store 7 using 3 bits
            .endCell();
        let slice: Slice = cell.asSlice();
        let loaded: Int = slice.loadUint(3);
        // loaded should be 7

        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 2: Optionals
contract TestOptionals() {
    fun run() {
        // Declare an optional Int with explicit null value
        let opt: Int? = null;
        // Assign a concrete value
        opt = 42;
        // Use non-null assertion operator
        let x: Int = opt!!; // Expected to be 42

        // Conditional check on optional
        if (opt != null) {
            // Valid branch -- no operation
        } else {
            // This branch won't execute
        }
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 3: Maps
contract TestMaps() {
    fun run() {
        // Define a map from Int to Int and perform operations
        let m: map<Int, Int> = emptyMap();
        m.set(0, 10);               // set key 0 to 10
        m.set(0, 42);               // override key 0 to 42
        let val1: Int = m.get(0)!!;   // Retrieve value, should be 42

        // Using replace and replaceGet methods
        let replaced: Bool = m.replace(0, 100);  // Should be true
        let old: Int = m.replaceGet(0, 55)!!;        // old value was 100 now replaced with 55

        // Delete key and check existence
        m.del(0);
        let exists: Bool = m.exists(0);  // Expected false

        // Shallow comparison with empty map
        let isEmpty: Bool = (m == emptyMap()); // Expected true now

        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 4: Composite Types – Structs
// Define structs as per documentation
struct One { number: Int; }
struct Params {
    name: String = "Satoshi";
    age: Int?; 
    val: One;
}

contract TestStructs() {
    fun run() {
        // Instantiate struct One
        let one: One = One{ number: 50 };
        // Instantiate Params using field punning for 'val'
        let params: Params = Params{ val: one };

        // Convert struct to Cell and back
        let cell: Cell = one.toCell();
        let oneFromCell: One = One.fromCell(cell);

        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 5: Message Types
// Define a message type with a 32-bit opcode as per documentation
message TestMsg { field: Int as uint8; }

contract TestMessage() {
    fun run() {
        // Instantiate the message
        let msg: TestMsg = TestMsg{ field: 42 };
        // Convert the message to a Cell (serialization)
        let cell: Cell = msg.toCell();
        
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}
