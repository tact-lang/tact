struct InnerMostNested {
    val: Int?;
}

struct L2 {
    nested: InnerMostNested?;
}

struct L1 {
    child: L2?;
    flag: Bool;
}

contract DeepNullablesTest {
    data: L1;

    init() {
        self.data = L1{
            child: null,
            flag: true
        };
    }
}