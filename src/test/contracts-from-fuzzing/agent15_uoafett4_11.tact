asm fun push42(): Int { 42 PUSHINT }

contract TestPush42 {
    receive() {
        dump(push42());
    }
}
