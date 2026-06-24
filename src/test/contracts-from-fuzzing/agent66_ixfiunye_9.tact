fun allEscapes(): String {
    return "backslash: \\ quote: \" newline: \n carriage: \r tab: \t vertical: \v backspace: \b formfeed: \f hex: \x41 unicode4: \u0042 unicode: \u{43}";
}

contract TestContract {
    receive() {
        allEscapes();
    }
}
