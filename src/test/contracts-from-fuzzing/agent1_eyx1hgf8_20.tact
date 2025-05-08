fun BuildString(): String {
    let b = beginString();
    b.append("Hello");
    b.append(" ");
    b.append("World!");
    return b.toString();
}

contract Test {
    receive() {
        let s = BuildString();
    }
}
