struct DeepNested1 {
    val: Int = 1;
}

struct DeepNested2 {
    inner: DeepNested1;
}

struct DeepNested3 {
    inner2: DeepNested2;
}

contract DeepTest {
    nested3: DeepNested3;

    init() {
        self.nested3 = DeepNested3{ inner2: DeepNested2{ inner: DeepNested1{} } };
    }
}