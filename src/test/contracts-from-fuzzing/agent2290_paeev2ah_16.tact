struct MixedDefault {
    i: Int = 12;
    b: Bool;
    s: String = "yo";
}

contract Test16 {
    val: MixedDefault;

    init() {
        self.val = MixedDefault{
            b: true
        };
    }
}