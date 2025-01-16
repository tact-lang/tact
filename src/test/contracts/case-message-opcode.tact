message(0xdeadbeef) MyMessageHex {
    x: Int;
}

message(3735928559) MyMessageDec {
    x: Int;
    y: Int;
}

message(0o33653337357) MyMessageOct {
    x: Int;
    y: Int;
    z: Int;
}

message(0b11011110101011011011111011101111) MyMessageBin {
    x: Int;
    y: Int;
    z: Int;
    w: Int;
}

message MyMessageAuto {
    value: Int;
}

const DEADBEEF: Int = 0xdeadbeef;

message(DEADBEEF + 1) MyMessageWithExprOpcode {
    a: Int;
}

contract TestContract {}
