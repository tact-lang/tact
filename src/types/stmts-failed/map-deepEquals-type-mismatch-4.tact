primitive Bool;
primitive Int;
primitive Address;

trait BaseTrait {}

contract Test {
    get fun foo(): Bool {
        let m1: map<Int as uint8, Bool> = emptyMap();
        m1.set(0, false);
        let m2: map<Int as uint16, Bool> = emptyMap();
        return m1.deepEquals(m2);
    }
}
