struct Deep3 {
    leaf: Int;
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
                nested: Deep3{
                    leaf: 42
                }
            }
        };
    }
}