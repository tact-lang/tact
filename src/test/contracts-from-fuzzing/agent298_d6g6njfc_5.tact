struct DeepNested {
    d1: Int;
    d2: Bool;
}

struct MidNested {
    m1: DeepNested;
}

contract MidDefaultTest {
    n: MidNested = MidNested{ m1: DeepNested{ d1: 7, d2: false } };
}
