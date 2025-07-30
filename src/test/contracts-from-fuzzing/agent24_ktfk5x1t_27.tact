asm fun depthTest(): Int { DEPTH }

contract TestAsm {
    receive() {
        let d: Int = depthTest();
        let _ = d;
        return;
    }
}
