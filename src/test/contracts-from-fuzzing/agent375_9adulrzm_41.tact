// Same struct as before, but with null for nested optional
struct NestedOpt {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    val: Int?;
    text: String?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: null,
            flag: false
        };
    }
}
