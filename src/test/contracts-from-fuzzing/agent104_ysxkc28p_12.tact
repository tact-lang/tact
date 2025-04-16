contract D {}

contract Test5 {
    receive() {
        let d_init = initOf D();
        // Force evaluation by accessing a field
        d_init.code;
    }
}
