struct HasString {
    s: String;
}

struct HasBool {
    b: Bool;
}

struct Combine {
    a: HasString;
    b: HasBool;
}

contract NestedCombine {
    field: Combine;

    init() {
        self.field = Combine{
            a: HasString{s:"hi"},
            b: HasBool{b:true},
        };
    }
}