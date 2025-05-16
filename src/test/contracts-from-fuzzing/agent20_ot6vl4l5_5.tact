struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Wrapper {
    inner: NestedOptional?;
}

contract DeepOptContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{ inner: null };
    }
}