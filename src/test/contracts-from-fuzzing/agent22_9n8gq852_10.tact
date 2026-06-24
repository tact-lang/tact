contract Test {
    receive() {
        let result = test();
    }
}

fun test(): String {
    // Testing Unicode
    return "😃 - test Unicode";
}
