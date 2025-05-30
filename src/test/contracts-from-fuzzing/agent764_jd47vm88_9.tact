struct OneOptional {
    foo: Int?;
}

contract OptionalDefaulted {
    data: OneOptional;

    init() {
        self.data = OneOptional{
            foo: null
        };
    }
}