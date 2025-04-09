contract AssemblyTest {
    asm fun depth(): Int { DEPTH }

    receive() {
        dump(self.depth());
    }
}
