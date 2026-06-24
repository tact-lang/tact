trait MyTrait {
    const X: Int = 1;
    fun f() {}
}

contract Test with MyTrait {
    const Y: Int = 2;
    a: Int;

    init() {
        self.a = self.X + self.Y;
    }
}