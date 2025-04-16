struct DefOpt {
    a: Int? = 1;
    b: Bool? = true;
    c: String? = "abc";
}
contract StructWithOptDefaults {
    s: DefOpt = DefOpt{};
    receive() {
        let _ = self.s.c;
    }
}