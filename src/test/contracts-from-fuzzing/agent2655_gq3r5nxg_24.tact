struct Embed {
    val: Int;
}

contract DefaultsVsInit {
    a: Int = 1;
    b: Int;
    c: Embed;

    init() {
        self.b = 42;
        self.c = Embed{val:5};
    }
}