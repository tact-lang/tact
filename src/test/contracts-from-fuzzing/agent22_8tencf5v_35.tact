// Struct with lots of fields mixing optionals with defaults inline, used as persistent
struct S {
    x: Int? = null;
    y: String? = null;
    z: Bool? = null;
    u: Int = 3;
    v: Bool = true;
    w: String = "abc";
}

contract MixDefaults {
    prop: S;

    init() {
        self.prop = S{};
    }
}