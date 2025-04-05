fun testOptionalSuccess() {
    // Testing optional: assignment and non-null assertion
    let opt: Int? = null;
    // Reassign optional to a non-null value
    let newOpt: Int? = 255;
    // Dump the non-null assertion; expected output: 255
    dump(newOpt!!);
}

contract TestOptionalSuccess {
    receive() {
        testOptionalSuccess();
    }
}
