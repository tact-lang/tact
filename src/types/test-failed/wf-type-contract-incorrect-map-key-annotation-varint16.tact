primitive Int;
primitive Address;
trait BaseTrait {}

contract Test {
    m: map<Int as varint16, Address> = emptyMap();
}

