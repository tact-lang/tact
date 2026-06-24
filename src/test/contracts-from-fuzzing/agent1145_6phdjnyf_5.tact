struct OptionalNested {
    optInner: Inner?;
}

struct Inner {
    deep: Deeper?;
}

struct Deeper {
    flag: Bool?;
    txt: String?;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            optInner: Inner{
                deep: Deeper{
                    flag: true,
                    txt: "hi"
                }
            }
        };
    }
}
