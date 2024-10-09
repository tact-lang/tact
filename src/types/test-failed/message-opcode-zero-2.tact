trait BaseTrait { }

// zero opcodes are reserved for string comments
message(pow(2, 4) - 16) ZeroOpcode { }

contract Test {
    receive(msg: ZeroOpcode) { }
}

