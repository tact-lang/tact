struct OptionalDeepStr {
    s1: String?;
    nested: OptionalNested?;
}

struct OptionalNested {
    s2: String?;
    s3: String?;
}

contract TestOptionalDeepStr {
    val: OptionalDeepStr = OptionalDeepStr{ s1:null, nested:null };

    init() {
        self.val = OptionalDeepStr{
            s1: "one",
            nested: OptionalNested{
                s2: "two",
                s3: "three"
            }
        };
    }
}