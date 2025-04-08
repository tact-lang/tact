struct HasBool {
    x: Bool;
}

struct HasOptionalBool {
    a: Bool?;
    b: HasBool;
}

contract OptBoolTest {
    field: HasOptionalBool;

    init() {
        self.field = HasOptionalBool{ a:null, b:HasBool{ x:true } };
    }
}
