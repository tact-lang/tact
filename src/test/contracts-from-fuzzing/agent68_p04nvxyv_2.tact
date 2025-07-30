struct One { number: Int; }

message TestMsg { value: Int as uint8; }

contract TypeFuzzer() {
    fun testPrimitive() {
         let i: Int = 42;
         let b: Bool = true;
         let s: String = "Hello";
         let c: Cell = s.asComment();
         let addr: Address = myAddress();
         dump(i);
         dump(b);
         dump(s);
         dump(c);
         dump(addr.asSlice().bits());
    }

    fun testOptional() {
         let opt: Int? = null;
         opt = 10;
         // non-null assertion
         dump(opt!!);
         if (opt != null) {
             dump(opt);
         } else {
             dump(0);
         }
    }

    fun testMap() {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 11);
         m.set(2, 22);
         dump(m.get(1)!!);
         dump(m.exists(2));
         m.del(2);
         dump(m.isEmpty());
    }

    fun testStruct() {
         let x: One = One{ number: 99 };
         let cell = x.toCell();
         let y = One.fromCell(cell);
         dump(x.number);
         dump(y.number);
    }

    fun testMessage() {
         // create a message instance
         let msg: TestMsg = TestMsg{ value: 7 };
         let cell = msg.toCell();
         let msg2 = TestMsg.fromCell(cell);
         dump(msg.value);
         dump(msg2.value);
    }

    receive() {
         self.testPrimitive();
         self.testOptional();
         self.testMap();
         self.testStruct();
         self.testMessage();
         cashback(sender());
    }
}
