struct Deep3 {
    last: Int?;
}

struct Deep2 {
    inner: Deep3;
}

struct Deep1 {
    inner: Deep2;
}

contract DeepNestedStruct {
    val: Deep1;

    init() {
        self.val = Deep1{ inner: Deep2{ inner: Deep3{ last: null }}};
    }
}
