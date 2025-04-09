struct MyStruct {
    x: Int;
    y: Bool;
}

contract MapStructTest {
    m: map<Int, MyStruct> = emptyMap();

    receive() {
        // Create an instance of MyStruct
        let s1: MyStruct = MyStruct { x: 100, y: true };
        // Insert the struct into the map under key 1
        self.m.set(1, s1);

        // Retrieve and use the struct from the map
        let s2: MyStruct? = self.m.get(1);
        // Assert that the struct was retrieved correctly
        dump(s2!!.x); // Expect to dump 100
        dump(s2!!.y); // Expect to dump true

        // Test deep equality by duplicating the map in a local variable
        let m2: map<Int, MyStruct> = emptyMap();
        m2.set(1, s1);
        let eq: Bool = self.m.deepEquals(m2);
        dump(eq); // Expected output: true

        // Iterate over the map entries using foreach with full capture
        foreach (k, v in self.m) {
            dump(k);
            dump(v.x);
            dump(v.y);
        }
    }
}
