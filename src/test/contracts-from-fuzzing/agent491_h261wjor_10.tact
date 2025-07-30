struct InnerMost { d: Int; } 

struct Inner2 { c: InnerMost; } 

struct Inner1 {
    b: Inner2?;
}

struct BaseOptionalLayer {
    a: Inner1?;
}

contract OptionalsWithinNestedStructs {
    val: BaseOptionalLayer;
    init() {
        self.val = BaseOptionalLayer{
            a: Inner1{
                b: Inner2{
                    c: InnerMost{ d: 7 }
                }
            }
        };
    }
}