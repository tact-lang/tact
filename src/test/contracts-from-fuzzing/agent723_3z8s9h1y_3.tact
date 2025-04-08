struct WithOptionals {
    name: String = "Anon";
    age: Int?;
    flag: Bool?;
    data: Cell?;
}

contract TestContract {
    details: WithOptionals;

    init() {
        self.details = WithOptionals{
            age: 23,
            flag: true,
            data: emptyCell(),
        };
    }
}