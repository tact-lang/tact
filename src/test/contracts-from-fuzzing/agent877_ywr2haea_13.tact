struct MultipleTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
}

contract ManyVariables {
    var1: Int;
    var2: Bool;
    var3: String;
    var4: Int?;
    var5: Bool?;
    var6: String?;
    var7: MultipleTypes;

    init() {
        self.var1 = 1;
        self.var2 = false;
        self.var3 = "hi";
        self.var4 = null;
        self.var5 = true;
        self.var6 = null;
        self.var7 = MultipleTypes{
            intField: 42,
            boolField: true,
            stringField: "xyz",
        };
    }
}