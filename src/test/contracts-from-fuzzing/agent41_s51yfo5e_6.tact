struct One { number: Int; }
struct Params { 
    name: String = "Satoshi"; 
    age: Int?; 
    val: One; 
}

contract TestStruct {
    fun test() {
        // Instantiate struct One
        let a: One = One{ number: 50 };
        dump(a.number); // Expect to dump 50

        // Instantiate Params with default name and null age
        let b: Params = Params{ val: a };
        dump(b.name); // Expect to dump "Satoshi"
        if (b.age == null) {
            dump(0); // Expect to dump 0
        } else {
            dump(b.age!!);
        }
    }
    
    receive() { self.test(); }
}
