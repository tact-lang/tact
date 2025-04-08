struct Multi {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestContract {
    val: Multi;

    init() {
        self.val = Multi{
            s1: "hi",
            s2: null,
            s3: "yo",
            s4: null
        };
    }
}