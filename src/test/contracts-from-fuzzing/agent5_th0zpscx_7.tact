contract StringBuilderConcatTest {
    receive() {
        let concatStringBuilder = beginString().concat("Hello, ").concat("World!");
        let resultString = concatStringBuilder.toString();
    }
}