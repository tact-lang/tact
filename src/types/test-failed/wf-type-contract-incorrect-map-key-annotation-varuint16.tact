primitive Int;
primitive Address;
trait BaseTrait {}

contract Test {
    m: map<Int as varuint16, Address> = emptyMap();
}

