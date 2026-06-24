struct DeepNestedOptional {
    inner: Middle?;
}

struct Middle {
    val: Leaf?;
}

struct Leaf {
    num: Int?;
    flag: Bool;
}

contract TestContract {
    st: DeepNestedOptional;
    
    init() {
        self.st = DeepNestedOptional{
            inner: Middle{
                val: Leaf{
                    num: null,
                    flag: true
                }
            }
        };
    }
}