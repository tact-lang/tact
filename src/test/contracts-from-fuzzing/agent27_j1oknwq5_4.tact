/// Test Composite Structures: Structs and Message Structs

// Define a simple struct and a struct with defaults and optionals
struct One { number: Int; }

struct Params {
    name: String = "default";  // default value
    age: Int?;                 // optional, default is null
    one: One;
}

// Message struct with an explicit opcode
message(777) MyMsg {
    value: Int as uint8;
}

contract TestStructs() {
    fun main() {
        // Instantiate struct One
        let s: One = One{ number: 10 };
        // Instantiate Params using field punning; default for 'name' and 'age'
        let p: Params = Params{ one: s };
        // Dump default name and value from One
        dump(p.name);          // expected: "default"
        dump(p.one.number);    // expected: 10
        
        // Convert Params to Cell and back
        let cellVal: Cell = p.toCell();
        let p2: Params = Params.fromCell(cellVal);
        dump(p2.name);         // expected: "default"
        
        // Test a message struct instantiation
        let m: MyMsg = MyMsg{ value: 42 };
        let mCell: Cell = m.toCell();
        // Re-parse the message struct
        let m2: MyMsg = MyMsg.fromCell(mCell);
        dump(m2.value);        // expected: 42
    }
    
    // Minimal receiver
    receive() { return; }
}
