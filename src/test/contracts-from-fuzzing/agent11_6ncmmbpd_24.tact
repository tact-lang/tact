asm fun get_depth(): Int { DEPTH }

contract Test {
    receive() {
         dump(get_depth());
    }
}
