/// This file contains a suite of minimal test cases for the Tact type system.
/// It tests primitive types, optionals, structs, maps, messages, and addresses.

//---------------------------
// Test 1: Primitive types and Optionals
//---------------------------
contract TestPrimitiveAndOptionals() {
    // Tests basic primitive operations
    fun test_primitive() {
        let a: Int = 1 + 1; // expected 2
        dump(a);
        let b: Bool = true && false; // expected false
        dump(b);
        let s: String = "Hello, Tact!";
        dump(s);
    }
    
    // Tests optionals: assignment, non-null assertion, and implicit null default
    fun test_optional() {
        let opt: Int? = null;
        // Initially opt is null. Now assign a value
        opt = 255;
        dump(opt!!); // expected 255

        let maybe: Bool? = null; // implicitly null
        if (maybe == null) {
            dump(0); // dumping 0 as signal of null
        } else {
            dump(1);
        }
    }
    
    receive() {
        self.test_primitive();
        self.test_optional();
        return;
    }
}

//---------------------------
// Test 2: Structs and Message Structs
//---------------------------

// Define a simple struct and a message
struct MyStruct { field: Int; }

message TestMsg { value: Int as uint8; }

contract TestStructs() {
    // Tests creation, cell conversion and deconstruction of a struct
    fun test_struct() {
        let s: MyStruct = MyStruct{ field: 123 };
        let cell = s.toCell();
        let s2 = MyStruct.fromCell(cell);
        dump(s2.field); // expected 123
    }

    // Tests message struct by directly accessing its field
    fun test_message() {
        let msg: TestMsg = TestMsg{ value: 77 };
        dump(msg.value); // expected 77
    }
    
    receive() {
        self.test_struct();
        self.test_message();
        return;
    }
}

//---------------------------
// Test 3: Maps
//---------------------------
contract TestMaps() {
    fun test_map() {
        // Create a map from Int to Int and perform built-in operations
        let m: map<Int, Int> = emptyMap();
        m.set(10, 42);
        dump(m.get(10)!!); // expected 42
        m.replace(10, 100);
        dump(m.get(10)!!); // expected 100
        dump(m.exists(20)); // expected false

        // Test deletion and idempotency
        m.del(10);
        dump(m.exists(10)); // expected false
    }
    receive() {
        self.test_map();
        return;
    }
}

//---------------------------
// Test 4: Message exchange and Addresses
//---------------------------
contract TestMessages() {
    // This contract sends a message to itself containing a TestMsg
    fun sendMsg() {
        message(MessageParameters{
            to: myAddress(),
            value: ton("0"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: TestMsg{ value: 77 }.toCell()
        });
    }
    
    // A binary receiver for TestMsg
    receive(msg: TestMsg) {
        dump(msg.value); // expected 77
    }
    
    // Also include an empty receiver that triggers sending a message
    receive() {
        self.sendMsg();
        return;
    }
}

//---------------------------
// Test 5: Addresses and Slices
//---------------------------
contract TestAddresses() {
    fun run() {
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        dump(std.workchain); // typically expected 0 on basechain
    }
    receive() {
        self.run();
        return;
    }
}
