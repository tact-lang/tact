struct Small {
    a: Int;
    b: Bool;
}

contract ArrayLike {
    val1: Small;
    val2: Small;
    val3: Small;

    init() {
        self.val1 = Small{a:1, b:true};
        self.val2 = Small{a:2, b:false};
        self.val3 = Small{a:3, b:true};
    }
}