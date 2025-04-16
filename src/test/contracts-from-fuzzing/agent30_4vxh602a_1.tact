struct Nested {
    deepField: Int;
}

struct Middle {
    optionalNested: Nested?;
}

contract DeeplyOptionalNested {
    data: Middle;
    
    init() {
        self.data = Middle{ optionalNested: null };
    }
}