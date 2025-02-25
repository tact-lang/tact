fun function_def_0() {
    try {
        throw(42);
    }
    dump(42);
}

fun function_def_1() {
    try {
        throw(42);
    } catch (err) {
        dump(err);
    }
}
