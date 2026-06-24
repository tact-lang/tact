contract MixedDepth {
    a: Int = 1;
    b: Int? = null;
    c: StructOne;
    d: StructTwo? = null;

    init() {
        self.c = StructOne{ x: 5, s: "hello" };
        self.d = StructTwo{ y: true, z: "bye" };
    }
}

struct StructOne {
    x: Int;
    s: String;
}

struct StructTwo {
    y: Bool;
    z: String;
}