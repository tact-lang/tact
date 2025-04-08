contract TestContract {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";
    s7: String = "g";
    s8: String = "h";
    s9: String = "i";
    s10: String = "j";
    s11: String = "k";
    s12: String = "l";
    s13: String = "m";
    s14: String = "n";
    s15: String = "o";

    init() {
        self.s1="a";self.s2="b";self.s3="c";self.s4="d";self.s5="e";
        self.s6="f";self.s7="g";self.s8="h";self.s9="i";self.s10="j";
        self.s11="k";self.s12="l";self.s13="m";self.s14="n";self.s15="o";
    }

    receive() { let k = self.s10; }
}