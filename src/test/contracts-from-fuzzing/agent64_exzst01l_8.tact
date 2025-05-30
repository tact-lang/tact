contract TestCasting {
    receive() {
        // Testing casting via extension function chaining: converting an integer to string using toString()
        let s: String = 42.toString();
        dump(s);
    }
}
