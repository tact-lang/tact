fun concat(a: String, b: String): String {
    let sb: StringBuilder = beginString();
    sb.append(a);
    sb.append(b);
    return sb.toString();
}

contract TestStringBuilder {
    receive() {
        let res: String = concat("Hello, ", "World!");
        dump(res);
    }
}
