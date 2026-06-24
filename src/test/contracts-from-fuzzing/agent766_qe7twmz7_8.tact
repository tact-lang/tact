struct ManyPrimitives {
    i1: Int = 1;
    b1: Bool = true;
    s1: String = "a";
    i2: Int = 2;
    b2: Bool = false;
    s2: String = "b";
    i3: Int = 3;
    b3: Bool = true;
    s3: String = "c";
    i4: Int = 4;
    b4: Bool = false;
    s4: String = "d";
    i5: Int = 5;
    b5: Bool = true;
    s5: String = "e";
}

contract BigDataTest {
    bigData: ManyPrimitives = ManyPrimitives{};
    init() {
        self.bigData = ManyPrimitives{ i1: 10, b1: false, s1: "X", i2: 20, b2: true, s2: "Y", i3: 30, b3: false, s3: "Z", i4: 40, b4: true, s4: "W", i5: 50, b5: false, s5: "Q" };
    }
}