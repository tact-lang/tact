struct WithManyOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Cell?;
    opt5: Address?;
}

contract ManyOptionalsTest {
    data: WithManyOptionals;

    init() {
        self.data = WithManyOptionals{
            opt1: 1,
            opt2: "test",
            opt3: true,
            opt4: emptyCell(),
            opt5: myAddress(),
        };
    }
}
