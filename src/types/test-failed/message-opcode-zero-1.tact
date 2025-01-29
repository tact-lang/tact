trait BaseTrait { }

// zero opcodes are reserved for string comments
message(0) ZeroOpcode { }

contract Test {
    receive(msg: ZeroOpcode) { }
}

