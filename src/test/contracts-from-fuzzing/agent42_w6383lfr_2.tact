contract SelfRec {
    init() {
        // Self-recursive initOf call
        let r = initOf SelfRec();
    }

    receive() {}
}
