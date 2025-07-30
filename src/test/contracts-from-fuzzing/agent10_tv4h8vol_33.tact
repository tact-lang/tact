contract TestOptionalAssignmentCorrect {
    receive() {
        let a: Int? = 42;
        a = null;
        dump(a);
    }
}
