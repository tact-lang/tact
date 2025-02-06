primitive Bool;
primitive Int;
primitive Address;

trait BaseTrait {}

contract Test {
    get fun foo(): Bool {
        let m1: map<Int, Int as uint16> = emptyMap();
        m1.set(0, 10);
        let m2: map<Int, Int> = emptyMap();
        return m1.deepEquals(m2);
    }
}
