contract WidePrimitivesContract {
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
    receive() {
        let _ = self.i4;
    }
}