struct A {
    x: Int;
    y: String;
}

contract ManyVars {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: String;
    v5: String;
    v6: Bool;
    v7: Bool;
    v8: Int?;
    v9: String?;
    v10: Bool?;
    s: A;

    init() {
        self.v1 = 1;
        self.v2 = 2;
        self.v3 = 3;
        self.v4 = "a";
        self.v5 = "b";
        self.v6 = true;
        self.v7 = false;
        self.v8 = null;
        self.v9 = null;
        self.v10 = null;
        self.s = A{x: 100, y: "test"};
    }
}