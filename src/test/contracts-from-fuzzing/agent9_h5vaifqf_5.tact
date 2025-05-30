fun nestedTry() : Int {
    try {
        try {
            throw(111);
        } catch (e) {
            // This division by zero will throw an exit code 4
            return e / 0;
        }
    } catch (e) {
        // Catch the inner error (exit code 4) and return it
        return e;
    }
}

fun main() {
    dump(nestedTry());
}
