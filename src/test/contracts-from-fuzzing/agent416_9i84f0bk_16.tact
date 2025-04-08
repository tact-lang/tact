struct MinimalOptional { field: Int? }

contract NoInitDefaults {
    foo: Int?;
    bar: MinimalOptional;

    init() {
        self.foo = null;
        self.bar = MinimalOptional{ field: null };
    }
}