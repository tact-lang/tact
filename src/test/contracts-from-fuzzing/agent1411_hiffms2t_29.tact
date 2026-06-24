// default value for struct field should default to null for optionals
struct Defaults {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestContract {
    field: Defaults;
    init() {
        self.field = Defaults{a:1,b:null,c:null};
    }
}