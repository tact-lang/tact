struct Mix {
    f1: Int;
    f2: String?;
    f3: Bool; 
    f4: String; 
    f5: Int?;
}

contract MixedFields {
    m: Mix;
    init() {
        self.m = Mix{
            f1: 1,
            f2: null,
            f3: true,
            f4: "xxx",
            f5: null
        };
    }
}