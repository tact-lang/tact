message(0x100) Add {}
message(0x101) Sub {}
message Mul {}
message Div {}

contract MessageOpcode {
    receive() {}

    get fun addOpcode(): Int {
        return Add.opcode();
    }

    get fun subOpcode(): Int {
        return Sub.opcode();
    }

    get fun mulOpcode(): Int {
        return Mul.opcode();
    }

    get fun divOpcode(): Int {
        return Div.opcode();
    }
}
