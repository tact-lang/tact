trait MyTrait {
    val1: Int;
    val2: Bool;
}

contract TestContract with MyTrait {
    val1: Int = 10;
    val2: Bool = true;
    extra: String = "hi";

    init() {
        self.val1 = 100;
        self.val2 = false;
        self.extra = "hey";
    }

    receive() {
        let _ = self.extra;
    }
}