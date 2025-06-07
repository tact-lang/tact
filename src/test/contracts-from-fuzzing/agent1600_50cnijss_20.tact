struct WithOptionals {
    part: Cell?;
    segment: Slice?;
    flag: Bool;
}

contract TestContract {
    field: WithOptionals;

    init() {
        self.field = WithOptionals{
            part: null,
            segment: null,
            flag: false
        };
    }
}