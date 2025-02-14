message SetKeyValue {
    key: Int;
    value: Int;
}

message ClearRequest {}

contract MapTestContract {
    receive() {}

    mapUnderTest: map<Int, Int>;

    get fun wholeMap(): map<Int, Int> {
        return self.mapUnderTest;
    }

    receive(_: ClearRequest) {
        self.mapUnderTest = emptyMap();
    }

    receive(data: SetKeyValue) {
        self.mapUnderTest.set(data.key, data.value);
    }
}