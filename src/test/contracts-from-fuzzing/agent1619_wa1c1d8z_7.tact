struct Inner1 { f1: Int; }
struct Inner2 { f2: Inner1; }
struct Inner3 { f3: Inner2; }

contract DeepNestedStructs {
    storage: Inner3;
    
    init() {
        self.storage = Inner3 {
            f3: Inner2 {
                f2: Inner1 {
                    f1: 7
                }
            }
        };
    }
}