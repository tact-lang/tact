message(0b101010) Binary {}
message(0o53) Octal {}
message(44) Decimal {}
message(0x2D) Hexadecimal {}

contract Example {
    receive(msg: Binary) { }
    receive(msg: Octal) { }
    receive(msg: Decimal) { }
    receive(msg: Hexadecimal) { }
}
