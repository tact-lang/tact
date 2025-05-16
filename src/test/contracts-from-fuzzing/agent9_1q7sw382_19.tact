contract GetterWithTryCatch {
    receive() {}

    get fun safeDivision(a: Int, b: Int): Int {
        try {
            return a / b;
        } catch (e) {
            // Return 0 in case of division by zero or any error
            return 0;
        }
    }
}
