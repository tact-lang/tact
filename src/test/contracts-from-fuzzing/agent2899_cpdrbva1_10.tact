struct OptionalBool { b: Bool?; }

contract OptBoolStorage {
    f: OptionalBool;

    init() {
        self.f = OptionalBool{ b: null };
    }
}
