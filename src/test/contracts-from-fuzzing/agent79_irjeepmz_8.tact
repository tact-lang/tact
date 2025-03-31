contract StringBuilderConcatTest {
    receive() {
        // Test StringBuilder concatenation using append() and conversion to String
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        dump(sb.toString());
    }
}
