struct Nested {
    a: Int;
    b: String;
}

struct WrapperOptional {
    nested: Nested?;  
}

contract NestedOptionals {
    wrapped: WrapperOptional;

    init() {
        self.wrapped = WrapperOptional{
            nested: null
        };
    }
}