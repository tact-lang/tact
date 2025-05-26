message(0b10) Bin {}
message(0o10) Oct {}
message(10) Dec {}
message(0x10) Hex {}

contract Tester {
    receive() {}

    receive(m: Bin) { require(m.opcode() == 2, "Incorrect message opcode: binary literal") }

    receive(m: Oct) { require(m.opcode() == 8, "Incorrect message opcode: octal literal") }

    receive(m: Dec) { require(m.opcode() == 10, "Incorrect message opcode: decimal literal") }

    receive(m: Hex) { require(m.opcode() == 16, "Incorrect message opcode: hex literal") }
}
