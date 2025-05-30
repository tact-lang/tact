struct One { number: Int; }
struct Params { 
    name: String = "Satoshi"; 
    age: Int?; 
    val: One; 
}

contract TestStructs {
    fun run() {
        let one: One = One { number: 50 };
        let params: Params = Params { val: one };
        // Dump default name
        dump(params.name); // expects "Satoshi"
        // Check optional age; dump 0 if null
        if (params.age == null) { 
            dump(0);
        } else {
            dump(params.age!!);
        }
        dump(params.val.number); // expects 50
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
