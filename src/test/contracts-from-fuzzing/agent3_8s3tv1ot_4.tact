fun useStringBuilder(): String {
    let b = beginString();
    b.append("Hello ");
    b.append("World");
    let x = b.toString();
    return x;
}

contract Test {
    receive() {
        let result = useStringBuilder();
    }
}