fun testMapUint8KeyOverflow(): map<Int as uint8, Int as uint8> {
    let mapExample: map<Int as uint8, Int as uint8> = emptyMap();
    mapExample.set(256, 42);
    return mapExample;
}

contract TestContract {
    receive() {
        testMapUint8KeyOverflow();
    }
}