struct SomeData {
    val: Int;
}

contract OptStructInit {
    s1: SomeData?;
    s2: SomeData?;

    init() {
        self.s1 = SomeData{val: 1};
        self.s2 = SomeData{val: 2};
    }
}