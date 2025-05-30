struct One { number: Int; }

struct Params {
    name: String = "Satoshi"; // default value
    age: Int?;              // default null
    val: One;
}

contract TestOptionalStruct() {
    fun run() {
        // Instantiate Params with only the mandatory field provided
        let p: Params = Params { val: One { number: 99 } };
        // Expected: name should be "Satoshi", age should be null
        dump(p.name); // expect: Satoshi
        // Check age: if null, dump 0
        if (p.age == null) {
            dump(0);
        } else {
            dump(p.age!!);
        }
    }

    receive() {
        self.run();
    }
}
