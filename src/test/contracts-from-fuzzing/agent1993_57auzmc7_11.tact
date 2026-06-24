struct OptionalDeeply {
    deep: DeepStruct?;
}

struct DeepStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    optDeep: OptionalDeeply;

    init() {
        self.optDeep = OptionalDeeply{ deep: null };
    }
}