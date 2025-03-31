fun concatUsingBuilder(): String {
    let b: StringBuilder = beginString();
    b.append("Hello");
    b.append(" ");
    b.append("World");
    return b.toString();
}

contract TestContract {
    receive() {
        let s: String = concatUsingBuilder();
    }
}
