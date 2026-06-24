struct WithManyOptionals {
    name: String?;
    age: Int?;
    comment: String?;
    balance: Int?;
}

contract OptTest {
    person: WithManyOptionals;

    init() {
        self.person = WithManyOptionals{
            name: null,
            age: null,
            comment: null,
            balance: null
        };
    }
}