struct MyStruct { a: Int; b: Bool; }

// Message struct with opcode 123
message(123) MyMsg { x: Int as uint8; }

contract StructMessageTest {
    // Test conversion of a struct to a Cell and back
    fun test() {
         let s: MyStruct = MyStruct{ a: 42, b: true };
         let cell: Cell = s.toCell();
         let s2: MyStruct = MyStruct.fromCell(cell);
         dump(s2.a); // Expected output: 42
         dump(s2.b); // Expected output: true
         
         // Test message struct conversion
         let msg: MyMsg = MyMsg{ x: 55 };
         let mcell: Cell = msg.toCell();
         dump(mcell); // Dumps the cell representing the message with opcode 123
    }

    fun main() {
         self.test();
    }
}

contract Dummy {}