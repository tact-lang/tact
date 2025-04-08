struct WithManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
}

contract TestContract {
    data: WithManyOptionals;

    init() {
        self.data = WithManyOptionals{
            f1: null,
            f2: 2,
            f3: null,
            f4: 4,
            f5: null,
        };
    }
}