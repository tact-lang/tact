struct NestedOption {
    val: Int?;
    sub: Sub?;
}

struct Sub {
    x: Int;
}

contract TestContract {
    data: NestedOption;

    init() {
        self.data = NestedOption{
            val: null,
            sub: Sub{ x: 10 },
        };
    }
}