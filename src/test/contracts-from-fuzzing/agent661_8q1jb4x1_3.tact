struct DeepLevel3 {
    x: Int;
    y: String;
}

struct DeepLevel2 {
    inner: DeepLevel3;
    opt: Bool?;
}

struct DeepLevel1 {
    nested: DeepLevel2;
    s: String?;
}

contract TestContract {
    val: DeepLevel1;

    init() {
        self.val = DeepLevel1{
            nested: DeepLevel2{
                inner: DeepLevel3{
                    x: 1,
                    y: "yo"
                },
                opt: null
            },
            s: "hi"
        };
    }
}