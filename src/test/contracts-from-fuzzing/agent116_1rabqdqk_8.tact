contract NoInit2 {}

contract TestNoInit2 {
    receive() {
        // Valid usage: even though NoInit2 has no explicit init, it gets an implicit empty init
        let s = initOf NoInit2();
    }
}
