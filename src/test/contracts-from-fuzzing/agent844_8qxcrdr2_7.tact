contract BigContract {
    bigInt1: Int;
    bigInt2: Int;
    bigInt3: Int;
    bigInt4: Int;
    bigInt5: Int;
    bigInt6: Int;
    bigInt7: Int;
    bigInt8: Int;
    bigInt9: Int;
    bigInt10: Int;
    bigBool1: Bool;
    bigBool2: Bool;
    bigBool3: Bool;
    bigBool4: Bool;
    bigBool5: Bool;
    bigBool6: Bool;
    bigString1: String;
    bigString2: String;
    bigString3: String;
    bigString4: String;
    bigString5: String;

    init() {
        self.bigInt1 = 1;
        self.bigInt2 = 2;
        self.bigInt3 = 3;
        self.bigInt4 = 4;
        self.bigInt5 = 5;
        self.bigInt6 = 6;
        self.bigInt7 = 7;
        self.bigInt8 = 8;
        self.bigInt9 = 9;
        self.bigInt10 = 10;
        self.bigBool1 = true;
        self.bigBool2 = false;
        self.bigBool3 = true;
        self.bigBool4 = false;
        self.bigBool5 = true;
        self.bigBool6 = false;
        self.bigString1 = "a";
        self.bigString2 = "b";
        self.bigString3 = "c";
        self.bigString4 = "d";
        self.bigString5 = "e";
    }

    receive() {
        let _ = self.bigInt1 + self.bigInt10;
        let _ = self.bigBool1 || self.bigBool6;
        let _ = self.bigString5;
    }
}
