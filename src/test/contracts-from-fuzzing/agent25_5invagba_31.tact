contract TestStringEscapesAdvanced {
    receive() {
        // Test advanced string escapes including Unicode and hex escapes
        let s: String = "Test escapes: \\ (backslash), \" (quote), \n (newline), \r (carriage return), \t (tab), \v (vertical tab), \b (backspace), \f (form feed), \x22 (quote), \u26A1 (lightning bolt), \u{1F602} (laughing emoji)";
        dump(s);
    }
}
