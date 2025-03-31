contract NoInit {}

contract TestNoInit {
    receive() {
        // Using initOf with a contract that has no explicit init() (implicit empty init() exists)
        let s: StateInit = initOf NoInit();
        let _ = s.code;
        let _ = s.data;
    }
}
