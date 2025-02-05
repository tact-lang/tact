primitive Bool;
primitive Int;
primitive Address;

trait BaseTrait {}

contract Test {
    get fun foo(): Bool {
        let m1: map<Int, Int> = emptyMap();
        m1.set(42, 0);
        let m2: map<Address, Int> = emptyMap();
        return m1.deepEquals(m2);
    }
}
