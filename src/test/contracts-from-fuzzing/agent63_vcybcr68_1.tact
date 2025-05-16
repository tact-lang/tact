struct One { number: Int; }

message TestMsg { val: Int as uint8; }

// Test case: Primitive types, correct assignments
contract TestPrimitive {
    fun main() {
        let a: Int = 1 + 1;
        let b: Int = 0b1010;
        let c: Bool = true;
        let d: Address = myAddress();
        let _ = "test".asComment();
        return;
    }

    receive() { }
}

// Test case: Optionals correct usage
contract TestOptional {
    fun main() {
        let opt: Int? = null;
        opt = 123;
        let x: Int = opt!!; // non-null assertion on a non-null optional
        return;
    }

    receive() { }
}

// Test case: Struct conversion round-trip
contract TestStruct {
    fun main() {
        let o: One = One{ number: 42 };
        let cell = o.toCell();
        let o2: One = One.fromCell(cell);
        require(o.number == o2.number, "Mismatch in struct conversion");
        return;
    }

    receive() { }
}

// Test case: Map correct usage
contract TestMap {
    fun main() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let v: Int = m.get(1)!!;
        require(v == 100, "Map value incorrect");
        return;
    }

    receive() { }
}

// Test case: Message struct conversion round-trip
contract TestMessage {
    fun main() {
        let m: TestMsg = TestMsg{ val: 200 };
        let cell = m.toCell();
        let m2: TestMsg = TestMsg.fromCell(cell);
        require(m.val == m2.val, "Message conversion mismatch");
        return;
    }

    receive() { }
}

// Test case: Destructuring StdAddress
contract TestDestructuring {
    fun main() {
        let addr: StdAddress = StdAddress{ workchain: 0, address: 12345 };
        let StdAddress{ address, .. } = addr;
        require(address == 12345, "Destructuring failed");
        return;
    }
    receive() { }
}
