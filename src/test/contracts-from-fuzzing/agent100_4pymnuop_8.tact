contract ConcatTest {
    receive() {
        let sb = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("world!");
        let s = sb.toString();
    }
}
