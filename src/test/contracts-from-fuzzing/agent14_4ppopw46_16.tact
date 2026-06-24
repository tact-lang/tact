contract TestSBConcat {
    receive() {
        // Test chaining of StringBuilder.concat to concatenate multiple string fragments
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("Tact ");
        sb = sb.concat("Compiler");
        dump(sb.toString());
    }
}
