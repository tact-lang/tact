contract LargeBoolOptMix {
    a: Bool; b: Bool?; c: Bool; d: Bool?; e: Bool; f: Bool?; g: Bool; h: Bool?;

    init() {
        self.a = true; self.b = null; self.c = false; self.d = null;
        self.e = true; self.f = null; self.g = false; self.h = null;
    }
}