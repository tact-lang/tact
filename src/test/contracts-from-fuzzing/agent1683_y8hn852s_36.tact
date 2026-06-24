struct DefaultOptional {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultsOptional {
    foo: DefaultOptional;

    init() {
        self.foo = DefaultOptional{};
    }

    receive() {
        self.foo = DefaultOptional{ a:1, b:true, c:"x" };
    }
}