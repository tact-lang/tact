contract TestStringUnicode {
    receive() {
        let unicodeStr: String = "Unicode characters: \u{1F600} \u{1F602} \u{1F603}"; 
        dump(unicodeStr);
    }
}