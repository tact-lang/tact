extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestPrimitive {
    fun run() {
        // Test primitive types: Int, Bool, String, Cell, Address
        let a: Int = 10 + 5;
        let b: Bool = true && false;
        let s: String = "Hello, Tact!";
        let c: Cell = s.asComment();
        let addr: Address = myAddress();
        return;
    }

    receive() {
        self.run();
    }
}

contract TestOptional {
    fun run() {
        // Test optionals: assignment, non-null assertion
        let opt: Int? = null;
        opt = 100;
        let x: Int = opt!!; // should be 100
        return;
    }

    receive() {
        self.run();
    }
}

contract TestMap {
    fun run() {
        // Test maps: setting, getting, deletion
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        let x: Int = m.get(1)!!; // should be 42
        m.del(1);
        return;
    }

    receive() {
        self.run();
    }
}

struct MyStruct { 
    val: Int;
}

contract TestStruct {
    fun run() {
        // Test struct serialization and deserialization
        let s: MyStruct = MyStruct { val: 256 };
        let cell: Cell = s.toCell();
        let s2: MyStruct = MyStruct.fromCell(cell);
        return;
    }

    receive() {
        self.run();
    }
}

contract TestAddress {
    fun run() {
        // Test address conversion and parsing
        let addr: Address = myAddress();
        let slice: Slice = addr.asSlice();
        let std: StdAddress = parseStdAddress(slice);
        return;
    }

    receive() {
        self.run();
    }
}

contract TestExtension {
    fun run() {
        // Test extension function for Int
        let s: String = 5.toCoinsString2();
        return;
    }

    receive() {
        self.run();
    }
}
