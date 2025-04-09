struct OptionalNested {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

struct ManyOptionals {
    a: OptionalNested?;
    b: OptionalNested?;
}

contract OptionalStructs {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:null
        };
    }
}