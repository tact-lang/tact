contract Test4 {
    receive() {
        test();
    }
}

fun test(): String {
    return "This is a 
multiline string";
}
