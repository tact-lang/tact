primitive Int;
trait BaseTrait { }

message((crc32("Tact") + 42) & 0xFFFF_FFFF) MsgWithExprOpcode {
    field: Int as uint4;
}

contract Foo {
    receive(msg: MsgWithExprOpcode) { }
}
