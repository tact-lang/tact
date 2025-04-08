struct WithOptionals {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
}

contract TestContract {
    data: WithOptionals;
    init() {
        self.data = WithOptionals{
            optionalInt: null,
            optionalBool: true,
            optionalAddress: null
        };
    }
}