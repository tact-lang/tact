struct DeepNested {
    innerVal: Int;
    flag: Bool;
}

struct Wrapper {
    nested: DeepNested;
    extra: Int;
}

contract TestContract {
    wrappedField: Wrapper;

    init() {
        self.wrappedField = Wrapper{
            nested: DeepNested{
                innerVal: 55,
                flag: false
            },
            extra: 99
        };
    }
}