// Struct with optional nested struct, with innermost string fields
struct Strings {
    one: String;
    two: String;
}

struct Container {
    nested: Strings?;
    flag: Bool;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            nested: Strings{
                one: "one",
                two: "two",
            },
            flag: true,
        };
    }
}
