struct NestedOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Wrapper {
    inner: NestedOptional?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{ inner: null };
    }

    receive() {
        if (self.data.inner != null) {
            dump(1);
        }
    }
}