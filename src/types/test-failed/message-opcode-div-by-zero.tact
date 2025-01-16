trait BaseTrait { }

message(42 / 0) DivByZeroOpcode { }

contract Test {
    receive(msg: DivByZeroOpcode) { }
}

