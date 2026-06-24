struct Leaf {
    value: Int?;     
}

struct Branch {
    leaf: Leaf?;     
}

contract DeepNestedPartialNull {
    data: Branch = Branch{
        leaf: Leaf{ value: 123 }
    };

    init() {}
}