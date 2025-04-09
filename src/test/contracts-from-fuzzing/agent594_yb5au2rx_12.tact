struct Weird {
    flag: Bool;
    number: Int as uint4; // 4-bit uint
    bit: Int as int1;    // 1-bit signed
    biggy: Int as int257; // max size
}

contract WeirdIntsContract {
    val: Weird = Weird { flag: true, number: 7, bit: 1, biggy: -1 };
}