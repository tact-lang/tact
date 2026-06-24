contract TestStringComplex {
    receive() {
        let complexStr: String = "String with newline:\n and tab:\t and quote: \" and backslash: \\ "; 
        dump(complexStr);
    }
}