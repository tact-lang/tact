contract TestContract {
    receive() {
        let newLine: String = "First line.\nSecond line.";
        let tabbed: String = "Column1\tColumn2";
        let escapedQuote: String = "He said, \"Hello!\"";
        
        dump(newLine);
        dump(tabbed);
        dump(escapedQuote);
    }
}