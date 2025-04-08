struct VeryNested {
    a: Int;
    b: OneMore;
}

struct OneMore {
    c: Int?;
    d: Deeper;
}

struct Deeper {
    f: Bool?;
    g: String;
}

contract DeepFieldsStorage {
    val: VeryNested;

    init() {
        self.val = VeryNested{
            a:1,
            b: OneMore{
                c: null,
                d: Deeper{
                    f: null,
                    g: "hey"
                }
            }
        };
    }
}