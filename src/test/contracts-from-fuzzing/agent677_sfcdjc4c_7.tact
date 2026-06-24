struct Alpha {
    a: Int = 1;
}
struct Beta {
    b: Bool = true;
}
struct Gamma {
    g: String = "test";
}
struct Delta {
    d: Int? = null;
}

contract MultiStructFields {
    x: Alpha;
    y: Beta;
    z: Gamma;
    q: Delta;

    init() {
        self.x = Alpha{ a: 42 };
        self.y = Beta{ b: false };
        self.z = Gamma{ g: "hello" };
        self.q = Delta{ d: 123 };
    }

    receive() {
        let _ = self.x.a + 1;
    }
}