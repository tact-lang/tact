struct One { number: Int; }
struct Params { 
    name: String = "Satoshi"; 
    age: Int?; 
    val: One;
}

contract TestStructs() {
    fun test() {
        let one: One = One{ number: 50 };
        dump(one.number); // should output 50
        let p: Params = Params{ val: one };
        dump(p.name);     // should output "Satoshi"
        dump(p.val.number); // should output 50
        
        // Test conversion to Cell and back
        let cell = one.toCell();
        let one2 = One.fromCell(cell);
        dump(one2.number); // should output 50
    }
    
    receive() {
        self.test();
    }
}
