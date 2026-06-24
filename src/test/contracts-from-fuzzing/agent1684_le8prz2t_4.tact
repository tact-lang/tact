struct Deep3 {
    val3: Int;
}

struct Deep2 {
    val2: Deep3;
}

struct Deep1 {
    val1: Deep2;
}

contract DeepNestedContract {
    value: Deep1 = Deep1{val1: Deep2{val2: Deep3{val3: 123}}};
    
    init() {
        self.value = Deep1{val1: Deep2{val2: Deep3{val3: 456}}};
    }
}