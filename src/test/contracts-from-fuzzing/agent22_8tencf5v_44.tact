// Make chain of nested structs with optional fields and default inline
struct S1 {
    v:Int? = null;
}
struct S2 {
    s:S1? = null;
}
struct S3 {
    s:S2? = null;
}

contract CascadeDefaults {
    root:S3;

    init() {
        self.root = S3{};
    }
}