message(0x12345678) M {
    val: Int;
}

contract PersistentMsg {
    m: M = M{ val: 42 };
}