struct Depth3 {
    deep: Int;
}

struct Depth2 {
    inner: Depth3;
}

struct Depth1 {
    mid: Depth2;
}

contract VeryDeepNested {
    val: Depth1;

    init() {
        self.val = Depth1{
            mid: Depth2{
                inner: Depth3{ deep: 42}
            }
        };
    }
}
