struct OptNested {
    child: Int?;
    deep: Deeper?;
}

struct Deeper {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    store: OptNested;

    init() {
        self.store = OptNested{
            child: null,
            deep: null
        };
    }
}