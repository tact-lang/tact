struct DeepNested {
    s: Nested2;
}

struct Nested2 {
    a: Nested3;
}

struct Nested3 {
    val: Int;
    flag: Bool;
}

contract DeepContract {
    d: DeepNested;
    init() {
        self.d = DeepNested{
            s: Nested2{
                a: Nested3{
                    val: 99,
                    flag: true
                }
            }
        };
    }
}