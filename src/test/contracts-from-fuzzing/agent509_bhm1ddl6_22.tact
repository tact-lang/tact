struct Alpha {
    i: Int;
}
struct Beta {
    s: String;
}
struct Gama {
    b: Beta;
    flag: Bool;
}

contract MultiStructs {
    a: Alpha;
    g: Gama;

    init() {
        self.a = Alpha{ i: 99 };
        self.g = Gama{ b: Beta{ s: "abc" }, flag: true };
    }
}