asm fun depth(): Int { DEPTH }

contract TestAsmDepthModule {
    receive() {
        dump(depth());
    }
}
