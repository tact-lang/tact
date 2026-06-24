contract TestStrings {
    receive() {
        let s = "Line1
Line2";
        let h = s.hashData();
    }
}