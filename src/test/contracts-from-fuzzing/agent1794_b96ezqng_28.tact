struct One {
    x: Int;
}

contract InitDefaultStruct {
    f: One = One{x:0};

    init() {
        self.f = One{x:42};
    }
}