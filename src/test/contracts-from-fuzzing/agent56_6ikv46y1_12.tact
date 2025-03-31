fun global(_: Int, _: Int): Int { 
    return 0; 
}

contract Test {
    receive() {
         dump(global(1, 2)); // Expected output: 0
    }
}
