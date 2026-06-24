struct Opcodes {
    header: Int as uint32;
    arg: Int;
}

contract TestOpcodes {
    val: Opcodes;

    init() {
        self.val = Opcodes{ header: 0xFFFFFFFF, arg: 123 };
    }
}