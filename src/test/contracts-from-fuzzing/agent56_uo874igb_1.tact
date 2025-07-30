contract TestInt() {
    fun run() {
        let a: Int = 3 / 2; // Expected to be 1 due to floor division as per docs
        dump(a);
    }
}

// Entry point to trigger the run function
// (In Tact, the contract code will be compiled and if tested via a debugger, the dump output can be observed.)
