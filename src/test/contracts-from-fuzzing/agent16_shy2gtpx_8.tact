struct One { number: Int; }
struct Params { 
    name: String = "Satoshi"; 
    age: Int?; 
    val: One; 
}

contract TestStructs() {
    fun test() {
        let one: One = One{ number: 50 };
        dump(one.number); // expected output: 50
        
        let p: Params = Params{ val: one };
        dump(p.name); // expected output: "Satoshi"
        
        // Check optional field; age is undefined, so it holds null
        if (p.age == null) {
            dump(0); // expected: 0
        } else {
            dump(1);
        }
    }

    receive() {
        self.test();
    }
}
