// Now test structs with many optionals and defaults
struct DefaultsOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract UsingDefaults {
    foo: DefaultsOptionals;
    init() {
        self.foo = DefaultsOptionals{};
    }
}