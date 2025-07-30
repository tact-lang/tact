fun nestedTry() {
    // Inner try-catch
    try {
        try {
            throw(101);
        } catch(e) {
            dump(101);
        }
        // After inner try, throw another error
        throw(202);
    } catch(e2) {
        dump(e2);
    }
}

fun main() {
    nestedTry();
}
