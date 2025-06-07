struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    val: One;
}

contract TestStruct() {
    fun run() {
         let one: One = One{ number: 50 };
         let p: Params = Params{ val: one };
         dump(p.name);      // Expected output: "Satoshi"
         dump(p.age);       // Expected output: null
         dump(p.val.number); // Expected output: 50
    }
    receive() {
        self.run();
    }
}
