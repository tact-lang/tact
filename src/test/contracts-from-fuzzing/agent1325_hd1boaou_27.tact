struct OptOnly {
    p: Int?;
    q: Bool?;
}

contract TestContract {
    val: OptOnly;

    init() {
        self.val = OptOnly{ p: null, q: null };
    }

    receive() {
        self.val = OptOnly{ p: 5, q: true };
    }
}