struct Deep3 {
    val: Int;
}

struct Deep2 {
    nested: Deep3;
}

struct Deep1 {
    nested: Deep2;
}

contract DeepNestedTest {
    data: Deep1;

    init() {
        self.data = Deep1{
            nested: Deep2{
                nested: Deep3{ val: 99 }
            }
        };
    }
}