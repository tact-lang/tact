struct Tiny {
    a: Int;
}

struct ContainsNullables {
    first: Int?;
    nested: Tiny?;
}

contract TestContract {
    data: ContainsNullables;
    init() {
        self.data = ContainsNullables{
            first: null,
            nested: null
        };
    }
}