struct Ints {
    a: Int;
    b: Int;
}

contract ReassignInInit {
    val: Ints;

    init() {
        self.val = Ints{a:1,b:2};
        self.val = Ints{a:5,b:6};
    }
}