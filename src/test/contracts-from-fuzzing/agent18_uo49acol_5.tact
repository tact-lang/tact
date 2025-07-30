struct MyStruct {
    a: Int;
    b: Bool;
}

message MyMsgStruct {
    a: Int as uint8;
    b: Bool;
}

contract TestStructsAndMessages() {
    fun testStruct() {
         // Instantiate a struct, convert to cell and back
         let s: MyStruct = MyStruct{ a: 77, b: false };
         let cellS = s.toCell();
         let s2 = MyStruct.fromCell(cellS);
         dump(s2.a);
         dump(s2.b);
    }
    
    // Receiver that uses a message struct
    receive(msg: MyMsgStruct) {
         dump(msg.a);
         dump(msg.b);
         self.testStruct();
    }
}
