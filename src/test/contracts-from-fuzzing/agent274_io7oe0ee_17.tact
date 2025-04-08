struct OptionalBool {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
}

contract OptionalBoolFields {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{
            f1:true,
            f2:null,
            f3:null,
        };
    }

    receive() {}
}
