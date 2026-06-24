struct Pair { a: Int; b: Int; }
struct Point { x: Int; y: Int; }

message(123) Msg {
    data: Int as uint32;
}

contract Main() {
    // Test for primitive Int
    fun testInt() {
        let a: Int = 1 + 1;
        dump(a); // expected output: 2
    }

    // Test for primitive Bool
    fun testBool() {
        let b: Bool = true && false;
        dump(b); // expected output: false
    }

    // Test for primitive String
    fun testString() {
        let s: String = "Hello, Tact";
        dump(s); // expected output: "Hello, Tact"
    }

    // Test for primitive Cell
    fun testCell() {
        let c: Cell = emptyCell();
        dump(c); // expected: empty cell
    }

    // Test for Optional type
    fun testOptional() {
        let opt: Int? = null;
        opt = 42;
        dump(opt!!); // expected output: 42
    }

    // Test for Map type
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        dump(m.get(1)!!); // expected output: 10
        dump(m.get(2)!!); // expected output: 20
    }

    // Test for Struct types
    fun testStruct() {
        let p: Pair = Pair{ a: 10, b: 20 };
        dump(p.a + p.b); // expected output: 30
    }

    // Test for Message struct (Msg)
    fun testMessage() {
        let m: Msg = Msg{ data: 456 };
        dump(m.data); // expected output: 456
    }

    // Test for combined types: a map with struct values
    fun testMapOfStructs() {
        let points: map<Int, Point> = emptyMap();
        points.set(0, Point{ x: 3, y: 4 });
        let pt = points.get(0)!!;
        dump(pt.x * pt.x + pt.y * pt.y); // expected output: 25
    }

    receive() {
        self.testInt();
        self.testBool();
        self.testString();
        self.testCell();
        self.testOptional();
        self.testMap();
        self.testStruct();
        self.testMessage();
        self.testMapOfStructs();
        cashback(sender());
    }
}
