import "./map-property-based";

message SetKeyValue {
    key: Int;
    value: Int;
}

message DeleteKey {
    key: Int;
}

message ClearRequest {}

contract MapTestContract { 
    receive() {}

    mapUnderTest: map<Int, Int>;

    init() {
        self.mapUnderTest = emptyMap();
    }

    get fun wholeMap(): map<Int, Int> {
        return self.mapUnderTest;
    }

    receive(_: ClearRequest) {
        self.mapUnderTest = emptyMap();
    }

    receive(data: SetKeyValue) {
        self.mapUnderTest.set(data.key, data.value);
    }

    receive(data: DeleteKey) {
        self.mapUnderTest.del(data.key);
    }

    get fun getValue(key: Int) : Int? {
        return self.mapUnderTest.get(key);
    }

    get fun exists(key: Int) : Bool {
        return self.mapUnderTest.exists(key);
    }
}