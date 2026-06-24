// test large contract parameter list without string concatenation
contract ManyParams(
    a1: Int,
    a2: Int,
    a3: Int,
    a4: Int,
    a5: Int,
    a6: Bool,
    a7: String,
    a8: String,
    a9: Bool,
    a10: Int,
    a11: Bool,
    a12: String,
    a13: Int?,
    a14: Bool?,
    a15: String?,
) {
    receive() {
        // dummy use
        let _ = self.a1 + self.a2 + self.a3 + self.a4 + self.a5 + self.a10 + (self.a13 != null ? self.a13!! : 0);
        let _ = self.a6 || self.a9 || self.a11 || (self.a14 != null ? self.a14!! : false);
        // strings ignored here
    }
}