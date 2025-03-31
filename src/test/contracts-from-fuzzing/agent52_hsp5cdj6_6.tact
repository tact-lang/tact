contract Test {
    receive() {
        dump("backslash: \\\\; double quote: \\\"; newline: \n; carriage: \r; tab: \t; vertical tab: \v; backspace: \b; formfeed: \f; hex: \x22; unicode: \u26A1; ext unicode: \u{1F602}");
    }
}
