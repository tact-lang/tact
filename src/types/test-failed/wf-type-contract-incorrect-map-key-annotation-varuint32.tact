primitive Int;
primitive Address;
trait BaseTrait {}

contract Test {
    m: map<Int as varuint32, Address> = emptyMap();
}

