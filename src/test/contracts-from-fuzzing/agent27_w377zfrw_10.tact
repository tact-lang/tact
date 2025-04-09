fun test_strbuilder_concat(): String {
    let sb: StringBuilder = beginString();
    let sb2: StringBuilder = sb.concat("Hello").concat(", ").concat("World!");
    return sb2.toString();
}

contract TestContract {
    receive() {
        test_strbuilder_concat();
    }
}
