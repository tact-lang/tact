struct Blend {
    i: Int;
    b: Bool;
    s: String;
    o: Other;
}

struct Other {
    a: Int?;
    z: String;
}

contract TestContract {
    blend: Blend;

    init() {
        self.blend = Blend{
            i: 1,
            b: false,
            s: "hi",
            o: Other{ a: null, z: "ok" }
        };
    }
}