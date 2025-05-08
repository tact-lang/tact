struct SOpt {
    a: Int = 0;
    b: String?;
}

contract NullAssignTest {
    val: SOpt;

    init() {
        self.val = SOpt{
            b: null
        };
    }
}