// Deep optional nesting with multiple optionals inside nested struct
struct Innermost {
    val: Int?;
    txt: String?;
}

struct Middle {
    content: Innermost?;
}

struct Outer {
    middleData: Middle?;
}

contract DeepOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            middleData: Middle{
                content: Innermost{
                    val: null,
                    txt: "hi",
                }
            }
        };
    }
}