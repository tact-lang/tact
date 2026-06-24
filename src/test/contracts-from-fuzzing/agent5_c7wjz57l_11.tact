contract TestContract {
    receive() {
        // Test string equality with a String literal and one constructed via StringBuilder
        let s1: String = "Hello";
        let sb: StringBuilder = beginString()
            .concat("Hel")
            .concat("lo");
        let s2: String = sb.toString();
        
        if (s1 == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
