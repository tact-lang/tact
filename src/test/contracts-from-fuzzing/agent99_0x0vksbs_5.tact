contract TestContract {
    fun testConcat(): String {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("TON");
        return sb.toString();
    }

    receive() {
        dump(self.testConcat());
    }
}
