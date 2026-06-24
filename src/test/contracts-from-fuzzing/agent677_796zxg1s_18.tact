struct Mixed {
    a: Int = 1;
    b: Int?;
    c: Int;
}

contract MixTest {
    m: Mixed;

    init() {
        self.m = Mixed{ a:1, b:null, c:2 };
    }
}