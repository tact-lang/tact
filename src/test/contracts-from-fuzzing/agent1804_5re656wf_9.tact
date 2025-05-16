struct OptionalDeepStruct {
    deep: Deep3?;
}

struct Deep1 {
    a: Int;
}

struct Deep2 {
    b: Deep1;
}

struct Deep3 {
    c: Deep2;
}

contract OptionalDeepNest {
    s: OptionalDeepStruct;

    init() {
        self.s = OptionalDeepStruct{ deep: null };
    }
}