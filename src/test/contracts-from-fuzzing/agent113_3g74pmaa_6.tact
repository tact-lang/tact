contract BuilderTest {
    receive() {
        // Testing StringBuilder for concatenating multiple string literals
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("Tact");
        sb.append(" testing!");
        let s: String = sb.toString();
        s; // evaluate s
    }
}
