struct OptionalBool {
    flag: Bool?;
}

contract StructInsideOptionalBool {
    f: OptionalBool;

    init() {
        self.f = OptionalBool{ flag:null };
    }
}