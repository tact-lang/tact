contract LargeInitParam(
    a: Int,
    b: Int,
    c: Int,
    d: Int,
    e: Int,
    f: Int,
    g: Int,
    h: Int,
    i: Int
) {
    // simple receiver so params are included
    receive() {
        dump(self.a + self.b + self.c + self.d + self.e + self.f + self.g + self.h + self.i);
    }
}