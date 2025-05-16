// Test composite types - Structs with default values and optionals

struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?; // implicit default null
    val: One;
}

fun testStructDefaults() {
    // Instantiating a struct using field punning for 'val'
    let p: Params = Params { val: One{ number: 100 } };
    // Expected default for name is "Satoshi"
    dump(p.name); // should output: Satoshi
    // Expected age is null so we check and dump 0 if null
    if (p.age == null) {
         dump(0); // expected output: 0
    } else {
         dump(p.age!!);
    }
}

contract TestStructDefaults {
    receive() {
        testStructDefaults();
    }
}
