struct OptionalBool {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
}

contract TestOptionalBool {
    val: OptionalBool = OptionalBool{ f1: null, f2: null, f3: null };

    init() {
        self.val = OptionalBool{ f1:true, f2:false, f3:true };
    }
}
