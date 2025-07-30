struct PrioritizeOptionals {
    o1: Int?;
    o2: Bool?;
    s: String;
    n: Int;
}

contract OptBeforeNormTest {
    val: PrioritizeOptionals;

    init() {
        self.val = PrioritizeOptionals{
            o1: null,
            o2: null,
            s: "after",
            n: 42
        };
    }

    receive(){}
}