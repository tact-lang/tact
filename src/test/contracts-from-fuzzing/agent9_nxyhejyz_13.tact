fun concatTwo(a: String, b: String): String {
    let sb = beginString();
    sb.append(a);
    sb.append(b);
    return sb.toString();
}

contract TestStrings {
    receive() {
        let result = concatTwo("Hello, ", "World!");
    }
}