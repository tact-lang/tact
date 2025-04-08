// frozen optional persistent fields initialized inline (repeat test in nested struct)
struct HasOptional {
    foo: Int? = null;
}

contract TestContract {
    bar: HasOptional;
    init() {
        self.bar = HasOptional{};
    }
}