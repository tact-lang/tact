contract StringsAndInts {
    s1: String = "x";
    s2: String = "y";
    n1: Int = 1;
    n2: Int = 2;
    receive() {
        let _ = self.s1;
    }
}