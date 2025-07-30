struct MultiOptionals {
    ai: Int?;
    ab: Bool?;
    astr: String?;
    acell: Cell?;
    aaddr: Address?;
}

contract TestContract {
    m: MultiOptionals;

    init() {
        self.m = MultiOptionals{
            ai: 1,
            ab: false,
            astr: null,
            acell: null,
            aaddr: null,
        };
    }
}