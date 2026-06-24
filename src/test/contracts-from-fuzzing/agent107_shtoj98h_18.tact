struct MultipleOptionals {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

struct Wrapper {
    field: MultipleOptionals;
}

contract TestContract {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            field: MultipleOptionals{
                a: null,
                b: true,
                c: null
            }
        };
    }
}
