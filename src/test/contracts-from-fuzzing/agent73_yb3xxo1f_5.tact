contract Test {
    receive() {
        // testing various string escape sequences
        let s1: String = "escape \\ if \\ you \\ can \\";             // literal backslashes and quotes
        let s2: String = "this \"literally\" works";                  // escaped double quotes
        let s3: String = "line \n another line";                           // newline
        let s4: String = "Shutters \r Like \r This \r One";              // carriage return
        let s5: String = "spacing \t granted!";                            // tab
        let s6: String = "those \v words \v are \v aligned";              // vertical tab
        let s7: String = "rm\b\bcreate!";                                  // backspace
        let s8: String = "form \f feed";                                    // form feed
        let s9: String = "this \x22literally\x22 works";                  // hex escape for double quote
        let s10: String = "danger, \u26A1 high voltage \u26A1";            // Unicode escape (4 hex digits)
        let s11: String = "\u{1F602} LOL \u{1F602}";                        // Unicode escape (braced)
    }
}
