// Nested optional primitives inside a struct wrapper
struct NestedOptWrap {
    wrap: InnerWrap;
}

struct InnerWrap {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

contract TestContract {
    s: NestedOptWrap;
    
    init() {
        self.s = NestedOptWrap{
            wrap: InnerWrap{
                intVal: null,
                boolVal: null,
                strVal: null
            }
        };
    }
}