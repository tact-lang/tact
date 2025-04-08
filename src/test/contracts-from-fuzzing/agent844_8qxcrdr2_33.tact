struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract OptDefaultsComb {
    val: ManyDefaults?;

    init() {
        self.val = null;
    }

    receive() {
        let _ = self.val;
    }
}