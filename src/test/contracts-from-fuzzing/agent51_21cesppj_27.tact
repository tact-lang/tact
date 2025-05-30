struct RepeatedOptional {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
    v5: Int?;
}

contract ManyNulls {
    r: RepeatedOptional;

    init() {
        self.r = RepeatedOptional{ v1:null, v2:null, v3:null, v4:null, v5:null };
    }
}