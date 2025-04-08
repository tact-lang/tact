struct MultipleOptionals {
    s: String?;
    inn: Inner?;
}

struct Inner {
    flag: Bool?;
    count: Int?;
}

contract TestContract {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals {
            s: null,
            inn: null
        };
    }
}