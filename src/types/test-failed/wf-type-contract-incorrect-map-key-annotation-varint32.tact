primitive Int;
primitive Address;
trait BaseTrait {}

contract Test {
    m: map<Int as varint32, Address> = emptyMap();
}

