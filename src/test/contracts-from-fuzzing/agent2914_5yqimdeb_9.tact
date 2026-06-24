struct InnerOptional {
    val: Bool?;
}

struct OuterOptional {
    inner: InnerOptional?;
    message: String;
}

contract ContractWithNestedOptionalStructOption {
    s: OuterOptional? = null;
    
    init() {}
}