struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
}

contract DefaultedStruct {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{ a:10, b:20, c:30, d:40, e:50 };
    }
}