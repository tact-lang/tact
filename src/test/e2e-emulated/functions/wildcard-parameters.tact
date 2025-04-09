fun globalAdd(_: Int, _: Int): Int {
    return 0;
}

asm fun globalAsmAdd(_: Int, _: Int): Int { ADD }

contract Test {
    receive() {}

    fun add(_: Int, _: Int): Int {
        return 0;
    }

    get fun contractAdd(): Int { return self.add(1, 2) }
    get fun globalAdd(): Int { return globalAdd(1, 2) }
    get fun globalAsmAdd(): Int { return globalAsmAdd(1, 2) }
}
