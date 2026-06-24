contract ParamContract(
    p1: Int,
    p2: Bool,
    p3: Int?,
    p4: Bool?,
    p5: Int,
    p6: Bool,
    p7: Int?,
    p8: Bool?,
    p9: Int,
    p10: Bool
) {
    receive() {
        // minimal usage
        require(self.p1 >= 0, "");
    }
}