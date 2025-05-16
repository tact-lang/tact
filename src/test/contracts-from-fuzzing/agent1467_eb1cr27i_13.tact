struct DeeplyNestedOptionals {
    a: InnerOptional1;
}

struct InnerOptional1 {
    b: InnerOptional2?;
}

struct InnerOptional2 {
    c: Int?;
}

contract TestDeepOptionals {
    data: DeeplyNestedOptionals;
    init() {
        self.data = DeeplyNestedOptionals{
            a: InnerOptional1{
                b: null
            }
        };
    }
}