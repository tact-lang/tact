struct One { number: Int; }
struct Params { name: String = "Satoshi"; age: Int?; val: One; }

message TestMsg { value: Int as uint8; }

// TestPrimitives: Tests basic primitive types: Int, Bool, String, Address, Cell
contract TestPrimitives() {
    fun run() {
       let i: Int = 123;
       let b: Bool = false;
       let s: String = "hello";
       let addr: Address = myAddress();
       let cellVal: Cell = emptyCell();
       dump(i);
       dump(b);
       dump(s);
       dump(addr);
       dump(cellVal);
    }
    receive() { self.run(); }
}

// TestOptionals: Tests usage of optionals, non-null assertion, and null check
contract TestOptionals() {
    fun run() {
       let opt: Int? = null;
       opt = 256;
       dump(opt!!); // should dump 256
       if (opt != null) { dump(opt); } else { dump(0); }
    }
    receive() { self.run(); }
}

// TestMaps: Tests creation, modification, and query of maps
contract TestMaps() {
    fun run() {
       let m: map<Int, Int> = emptyMap();
       m.set(1, 10);
       m.set(2, 20);
       if (m.exists(2)) { dump(m.get(2)!!); }
       m.del(1);
       dump(m.isEmpty());
    }
    receive() { self.run(); }
}

// TestStructs: Tests struct instantiation, default field, and optional field
contract TestStructs() {
    fun run() {
       let o: One = One{ number: 50 };
       let p: Params = Params{ val: o };
       dump(o.number);
       dump(p.name);
       // p.age should be null by default
       if (p.age == null) { dump(0); } else { dump(p.age!!); }
    }
    receive() { self.run(); }
}

// TestMsgContract: Tests message struct conversion to/from Cell
contract TestMsgContract() {
    fun run() {
       let msgCell: Cell = TestMsg{ value: 42 }.toCell();
       let msg: TestMsg = TestMsg.fromCell(msgCell);
       dump(msg.value);
    }
    receive() { self.run(); }
}

// TestNumbers: Tests various number literal formats
contract TestNumbers() {
    fun run() {
       dump(1_000);   // decimal
       dump(0b1010);  // binary: 10
       dump(0o755);   // octal: 493
       dump(0xff);    // hexadecimal: 255
    }
    receive() { self.run(); }
}

// TestCellSlice: Tests conversion from Cell to Slice and querying bit length
contract TestCellSlice() {
    fun run() {
       let cellVal: Cell = "Test".asComment();
       let sliceVal: Slice = cellVal.asSlice();
       dump(sliceVal.bits());
    }
    receive() { self.run(); }
}
