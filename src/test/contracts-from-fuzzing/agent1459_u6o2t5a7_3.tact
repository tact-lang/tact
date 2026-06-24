struct DeepNested3 {
    q: Int?;
    r: Bool;
}

struct DeepNested2 {
    m: DeepNested3;
    n: String;
}

struct DeepNested1 {
    k: Int;
    l: DeepNested2;
}

contract DeepNestTest {
    data: DeepNested1;

    init() {
        self.data = DeepNested1{
            k: 1,
            l: DeepNested2{
                m: DeepNested3{q: null, r: true},
                n: "nested"
            }
        };
    }
}
