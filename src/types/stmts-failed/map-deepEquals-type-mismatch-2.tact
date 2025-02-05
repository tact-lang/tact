primitive Bool;
primitive Int;
primitive Address;

trait BaseTrait {}

contract Test {
    get fun foo(): Bool {
        let m1: map<Address, Int> = emptyMap();
        m1.set(address(""), 0);
        let m2: map<Int, Address> = emptyMap();
        return m1.deepEquals(m2);
    }
}
