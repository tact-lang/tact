struct InnerOpt {
    x: Int?;
    y: String?;
}

struct OuterOpt {
    foo: InnerOpt?;
}

contract DeepOptionals {
    val: OuterOpt?;

    init() {
        self.val=null;
    }
}