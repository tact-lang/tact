// Optional string edge case
contract StringNull {
    s1: String?;
    s2: String?;
    init() {
        self.s1 = "";
        self.s2 = null;
    }
}