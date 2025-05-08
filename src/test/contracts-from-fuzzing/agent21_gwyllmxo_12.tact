fun repeatString(s: String): String {
    return s;
}

contract TestStringFun {
    receive() {
        let test = repeatString("Hello!");
    }
}