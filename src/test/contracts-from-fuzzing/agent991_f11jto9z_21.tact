struct Huge {
 a0: Int = 0;
 a1: Int = 1;
 a2: Int = 2;
 a3: Int = 3;
 a4: Int = 4;
 a5: Int = 5;
 a6: Int = 6;
 a7: Int = 7;
 a8: Int = 8;
 a9: Int = 9;
 b0: Bool = true;
 b1: Bool = false;
 b2: Bool = true;
 b3: Bool = false;
 b4: Bool = true;
 b5: Bool = false;
 s0: String = "s0";
 s1: String = "s1";
 s2: String = "s2";
 s3: String = "s3";
 s4: String = "s4";
 s5: String = "s5";
 optInt: Int? = null;
 optBool: Bool? = null;
 optStr: String? = null;
 i20: Int = 20;
 i21: Int = 21;
 i22: Int = 22;
 i23: Int = 23;
}

contract BigPersist {
 huge: Huge = Huge{};
 init() {}
}