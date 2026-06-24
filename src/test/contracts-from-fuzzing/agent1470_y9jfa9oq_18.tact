// Mix of default and optional fields in struct
struct Mix {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
    d: Bool = false;
    e: String?;
}

contract MixDefaultsOpt {
    val: Mix;

    init() {
        self.val = Mix{
            b:null,
            e:"ok",
        };
    }
}