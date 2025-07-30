struct LongStringFields {
    alpha: String;
    beta: String;
    gamma: String;
    delta: String;
    epsilon: String;
    zeta: String;
    eta: String;
    theta: String;
}

contract LongStrTest {
    field: LongStringFields;

    init() {
        self.field = LongStringFields{
            alpha: "a",
            beta: "b",
            gamma: "c",
            delta: "d",
            epsilon: "e",
            zeta: "z",
            eta: "h",
            theta: "t",
        };
    }
}