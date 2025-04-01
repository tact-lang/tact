fun braveAndTrue() {
    try {
        nativeThrow(42);
    }
    dump(42);
}

fun niceCatch() {
    try {
        nativeThrow(42);
    } catch (err) {
        dump(err);
    }
}