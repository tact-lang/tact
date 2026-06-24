struct Mix {
    fixed: Int = 2;
    opt: Int?;
    str: String;
    bool: Bool;
}

contract MixedDefaultOpt {
    m: Mix;
    init() {
        self.m = Mix{
            opt: null, str: "hi", bool: true
        };
    }
}