message SetIntMap1 {
    key: Int;
    value: Int?;
}
message SetIntMap2 {
    key: Int;
    value: Bool?;
}
message SetIntMap3 {
    key: Int;
    value: Cell?;
}

struct SomeStruct {
    value: Int;
}

contract MapTestContract {

    // Int Keys
    intMap1: map[Int]Int;
    intMap2: map[Int]Bool;
    intMap3: map[Int]Cell;
    intMap4: map[Int]SomeStruct;

    // Address Keys
    addrMap1: map[Address]Int;
    addrMap2: map[Address]Bool;
    addrMap3: map[Address]Cell;
    addrMap4: map[Address]SomeStruct;

    init() {
        // Nothing to do
    }

    receive(msg: SetIntMap1) {
        self.intMap1.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap2) {
        self.intMap2.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap3) {
        self.intMap3.set(msg.key, msg.value);
    }

    get fun intMap1(): map[Int]Int {
        return self.intMap1;
    }

    get fun intMap1Value(key: Int): Int? {
        return self.intMap1.get2(key);
    }

    get fun intMap2(): map[Int]Bool {
        return self.intMap2;
    }

    get fun intMap2Value(key: Int): Bool? {
        return self.intMap2.get2(key);
    }

    get fun intMap3(): map[Int]Cell {
        return self.intMap3;
    }

    get fun intMap3Value(key: Int): Cell? {
        return self.intMap3.get2(key);
    }

    get fun intMap4(): map[Int]SomeStruct {
        return self.intMap4;
    }

    get fun intMap4Value(key: Int): SomeStruct? {
        return self.intMap4.get2(key);
    }

    get fun addrMap1(): map[Address]Int {
        return self.addrMap1;
    }

    get fun addrMap2(): map[Address]Bool {
        return self.addrMap2;
    }

    get fun addrMap3(): map[Address]Cell {
        return self.addrMap3;
    }

    get fun addrMap4(): map[Address]SomeStruct {
        return self.addrMap4;
    }
}