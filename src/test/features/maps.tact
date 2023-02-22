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

message SetIntMap4 {
    key: Int;
    value: SomeStruct?;
}

message SetIntMap5 {
    key: Int;
    value: SomeStruct;
}

message SetAddrMap1 {
    key: Address;
    value: Int?;
}

message SetAddrMap2 {
    key: Address;
    value: Bool?;
}

message SetAddrMap3 {
    key: Address;
    value: Cell?;
}

message SetAddrMap4 {
    key: Address;
    value: SomeStruct?;
}

message SetAddrMap5 {
    key: Address;
    value: SomeStruct;
}

struct SomeStruct {
    value: Int;
}

contract MapTestContract {

    init() {
        // Nothing to do
    }

    receive() {
        // Nothing to do
    }

    //
    // Int Maps
    //

    intMap1: map<Int, Int>;
    intMap2: map<Int, Bool>;
    intMap3: map<Int, Cell>;
    intMap4: map<Int, SomeStruct>;

    receive(msg: SetIntMap1) {
        self.intMap1.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap2) {
        self.intMap2.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap3) {
        self.intMap3.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap4) {
        self.intMap4.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap5) {
        self.intMap4.set(msg.key, msg.value);
    }

    get fun intMap1(): map<Int, Int> {
        return self.intMap1;
    }

    get fun intMap1Value(key: Int): Int? {
        return self.intMap1.get(key);
    }

    get fun intMap2(): map<Int, Bool> {
        return self.intMap2;
    }

    get fun intMap2Value(key: Int): Bool? {
        return self.intMap2.get(key);
    }

    get fun intMap3(): map<Int, Cell> {
        return self.intMap3;
    }

    get fun intMap3Value(key: Int): Cell? {
        return self.intMap3.get(key);
    }

    get fun intMap4(): map<Int, SomeStruct> {
        return self.intMap4;
    }

    get fun intMap4Value(key: Int): SomeStruct? {
        return self.intMap4.get(key);
    }

    //
    // Address Keys
    //

    addrMap1: map<Address, Int>;
    addrMap2: map<Address, Bool>;
    addrMap3: map<Address, Cell>;
    addrMap4: map<Address, SomeStruct>;

    receive(msg: SetAddrMap1) {
        self.addrMap1.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap2) {
        self.addrMap2.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap3) {
        self.addrMap3.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap4) {
        self.addrMap4.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap5) {
        self.addrMap4.set(msg.key, msg.value);
    }

    receive("reset") {
        self.addrMap1 = emptyMap();
        self.addrMap2 = emptyMap();
        self.addrMap3 = emptyMap();
        self.addrMap4 = emptyMap();

        self.intMap1 = emptyMap();
        self.intMap2 = emptyMap();
        self.intMap3 = emptyMap();
        self.intMap4 = emptyMap();
    }

    get fun addrMap1(): map<Address, Int> {
        return self.addrMap1;
    }
    
    get fun addrMap1Value(key: Address): Int? {
        return self.addrMap1.get(key);
    }

    get fun addrMap2(): map<Address, Bool> {
        return self.addrMap2;
    }

    get fun addrMap2Value(key: Address): Bool? {
        return self.addrMap2.get(key);
    }

    get fun addrMap3(): map<Address, Cell> {
        return self.addrMap3;
    }

    get fun addrMap3Value(key: Address): Cell? {
        return self.addrMap3.get(key);
    }

    get fun addrMap4(): map<Address, SomeStruct> {
        return self.addrMap4;
    }

    get fun addrMap4Value(key: Address): SomeStruct? {
        return self.addrMap4.get(key);
    }
}