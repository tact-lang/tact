contract Test10 {
    receive() {
        sample();
    }
}

fun sample(): String {
    let sb = beginString();
    sb.append("Hello, ");
    sb.append("world!");
    return sb.toString();
}
