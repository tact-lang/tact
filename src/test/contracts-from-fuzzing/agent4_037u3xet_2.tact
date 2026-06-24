fun niceCatch() {
    try {
        throw(1042);
    } catch (err) {
        dump(err);
    }
}

// A main function to invoke niceCatch - if needed
fun main() {
    niceCatch();
}