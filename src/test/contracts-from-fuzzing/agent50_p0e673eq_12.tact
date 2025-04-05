struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?; // implicitly null
    val: One;
}

contract TestStructDefault {
    fun test() {
        let one: One = One{ number: 50 };
        let p: Params = Params{ val: one };
        // Expect default value "Satoshi"
        dump(p.name);
        if (p.age == null) {
            dump(0);
        } else {
            dump(p.age!!);
        }
    }
    receive() { self.test(); }
}
