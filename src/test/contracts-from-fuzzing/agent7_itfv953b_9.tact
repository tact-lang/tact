struct InnerData {
    f1: Int;
    f2: Bool;
}

contract ManyVariables {
    v1: Int = 0;
    v2: Int = 1;
    v3: Int = 2;
    v4: Bool = false;
    v5: Bool = true;
    v6: String = "";
    v7: InnerData;

    init() {
        self.v7 = InnerData{ f1: 42, f2: true };
    }
}