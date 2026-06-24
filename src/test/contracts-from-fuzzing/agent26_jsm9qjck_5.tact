struct Point { x: Int; y: Int; }

// Define a simple message with a uint8 field
message DemoMsg { value: Int as uint8; }

contract FuzzTypes() {
    // Test various primitive types
    fun testPrimitives() {
        let i: Int = 42;
        let b: Bool = true && false; // should be false
        let s: String = "Test";
        let c: Cell = s.asComment();
        dump(i);      // Expect: 42
        dump(b);      // Expect: false
        dump(s);      // Expect: "Test"
        dump(c);      // Expect: cell representing the string with prefixed 32 zero bits
    }

    // Test optional types
    fun testOptionals() {
        let opt: Int? = null;
        if (opt == null) {
            dump(0); // Expected output: 0
        } else {
            dump(opt!!);
        }
        opt = 100;
        dump(opt!!); // Expect: 100
    }

    // Test map types
    fun testMaps() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        dump(m.get(1)!!);      // Expect: 10
        dump(m.exists(3));     // Expect: false
        m.del(1);
        dump(m.exists(1));     // Expect: false
    }

    // Test structs and their conversion to and from Cells
    fun testStructs() {
        let p: Point = Point{ x: 5, y: 7 };
        let cell: Cell = p.toCell();
        let p2: Point = Point.fromCell(cell);
        dump(p2.x); // Expect: 5
        dump(p2.y); // Expect: 7
    }

    // Test message structs and conversion
    fun testMessages() {
        let msg: DemoMsg = DemoMsg{ value: 255 };
        let cell: Cell = msg.toCell();
        dump(cell); // Expect: A cell representing the message
    }

    // Main function to run all tests
    fun main() {
        self.testPrimitives();
        self.testOptionals();
        self.testMaps();
        self.testStructs();
        self.testMessages();
    }

    // Automatically run main when a message is received
    receive() {
        self.main();
    }
}
