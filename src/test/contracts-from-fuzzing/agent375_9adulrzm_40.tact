// Optional nested struct with optional primitive inside
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
            inner: Inner{val:null, text:null},
            flag: true
        };
    }
}
