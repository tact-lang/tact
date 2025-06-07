asm fun depth(): Int { DEPTH }

contract Test {
    receive() {
         dump(depth());
    }
}
