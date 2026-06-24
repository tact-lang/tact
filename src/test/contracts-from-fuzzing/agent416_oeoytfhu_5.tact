struct SOpt {
    optA: Int?;
    optB: Bool?;
}

contract Test6 {
    val: SOpt;

    init() {
        self.val = SOpt{
            optA: null,
            optB: true
        };
    }
}
