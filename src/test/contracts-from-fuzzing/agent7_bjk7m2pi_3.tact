fun testNestedTryCatch() {
    // This function tests nested try-catch behavior
    try {
        let x = 0;
        try {
            throw(101); // inner try throws exit code 101
        } catch (err) {
            dump(err);        // Should dump 101
            // Intentional division by zero to trigger error (exit code 4) in inner catch block
            let y = err / x;
        }
    } catch (outer) {
        // Outer catch should capture the error from the inner division by zero
        dump(outer);
    }
}

fun main() {
    testNestedTryCatch();
}
