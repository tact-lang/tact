fun testMapUint8KeysValues(): map<Int as uint8, Int as uint8> {
    let mapExample: map<Int as uint8, Int as uint8> = emptyMap();
    mapExample.set(128, 255);
    return mapExample;
}

contract TestContract {
    receive() {
        testMapUint8KeysValues();
    }
}