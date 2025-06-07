trait MyBase {
    baseVar: Int;
}

contract InheritMix with MyBase {
    baseVar: Int;
    localVar: Bool;

    init() {
        self.baseVar = 123;
        self.localVar = true;
    }
}