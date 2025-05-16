struct OptionalBoolString {
    b: Bool?;
    s: String?;
}

struct Level1 {
    a: OptionalBoolString;
    b: OptionalBoolString?;
}

contract DeepNestedOpts {
    val: Level1?;
    
    init() {
        self.val = Level1{
            a: OptionalBoolString{ b: null, s: null },
            b: null,
        };
    }
}