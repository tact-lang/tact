// Contract constant initialization stress

contract ConstantsStress {
    const X: Int = 42;
    const Y: Int = 100;
    const STR: String = "abc";

    val1: Int;
    val2: Int;
    val3: String;

    init() {
        self.val1 = self.X + 1;
        self.val2 = self.Y + 1;
        self.val3 = self.STR;
    }
}