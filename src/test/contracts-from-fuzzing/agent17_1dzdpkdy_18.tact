struct ContainsOptionals {
    s: Slice?;
    c: Cell?;
    flag: Bool;
}

contract TestContract {
    co: ContainsOptionals;

    init() {
        self.co = ContainsOptionals{
            s: null,
            c: null,
            flag: true,
        };
    }
}