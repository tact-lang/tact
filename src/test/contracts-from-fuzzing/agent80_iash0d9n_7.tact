fun testConcat(): String {
    let sb: StringBuilder = beginString();
    sb.append("Hello");
    sb.append(", ");
    sb.append("Tact!");
    return sb.toString();
}

fun testAscii(): Int {
    // ascii is a compile-time function requiring constant string literal
    return ascii("abc");
}

contract TestContract {
    receive() {
        let str: String = testConcat();
        dump(str.hashData());
        dump(testAscii());
    }
}
