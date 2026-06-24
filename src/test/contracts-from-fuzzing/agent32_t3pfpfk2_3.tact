contract Recursive {
    init() {
        // Recursive self-init: calling initOf for itself within its own init
        let s: StateInit = initOf Recursive();
    }
    receive() {}
}
