/// Test case: Structs with default field values
// As per [Structs and message structs] documentation, fields with default values should be omitted and automatically set

struct Params {
    name: String = "Satoshi"; // default value
    age: Int?;                // optional field with implicit default null
}

contract TestStructDefaults {
    fun run() {
        // Instantiate a Params struct without specifying the 'name' field
        let p: Params = Params{ age: 42 };
        // Dump the name field; expected to be "Satoshi" as default
        dump(p.name);
        // Dump the age field; expected to be 42
        dump(p.age!!);
    }
    receive() {
        self.run();
    }
}
