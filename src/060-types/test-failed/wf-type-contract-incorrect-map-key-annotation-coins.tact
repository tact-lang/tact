primitive Int;
primitive Address;
trait BaseTrait {}

contract Test {
    m: map<Int as coins, Address> = emptyMap();
}

