struct WithOptionals {
    foo: Int?;
    bar: Bool?;
}

contract OptStructInStorage {
    s: WithOptionals;

    init() {
        self.s = WithOptionals{
            foo: null,
            bar: true
        };
    }
}