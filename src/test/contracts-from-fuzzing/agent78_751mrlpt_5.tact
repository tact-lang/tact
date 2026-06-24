contract StringBuilderConcatTest {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("World!");
        let result: String = sb.toString();
        dump(result);
    }
}