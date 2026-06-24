contract ManyConstants {
    const a: Int = 1;
    const b: Int = 2;
    const c: Int = 3;
    const d: Int = 4;
    const e: Int = 5;
    const f: Int = 6;
    const g: Int = 7;
    const h: Int = 8;
    const i: Int = 9;
    const j: Int = 10;

    receive() {
        let sum = self.a + self.b + self.c + self.d + self.e + self.f + self.g + self.h + self.i + self.j;
        sum;
    }
}
