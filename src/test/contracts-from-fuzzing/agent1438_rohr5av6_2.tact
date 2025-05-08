struct SOpt {
    a: Int?;
    b: String?;
    c: Address?;
}

contract OptStructTest {
    val: SOpt;

    init() {
        self.val = SOpt{
            a: 12,
            b: null,
            c: null,
        };
    }
}