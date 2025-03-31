contract Test6 {
    receive() {
        // Using codeOf on the current contract
        let _code = codeOf Test6;

        // Using initOf on current contract; note that even if the init function is implicit, this returns the StateInit
        let _init = initOf Test6();
    }
}
