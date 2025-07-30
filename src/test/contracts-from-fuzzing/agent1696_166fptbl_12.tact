struct Deep4 {
    val: Int;
}
struct Deep3 {
    d4: Deep4;
}
struct Deep2 {
    d3: Deep3;
}
struct Deep1 {
    d2: Deep2;
}

contract LongChainTest {
    chain: Deep1;

    init() {
        self.chain = Deep1{ d2: Deep2{ d3: Deep3{ d4: Deep4{ val: 123 } } } };
    }
}