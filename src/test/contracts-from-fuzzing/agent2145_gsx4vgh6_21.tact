struct Mix {
    optInt: Int?;
    optBool: Bool?;
    nested: Inner;
}

struct Inner {
    s: String;
    optAddr: Address?;
}

contract StorageTest {
    val: Mix;

    init() {
        self.val = Mix{
            optInt:null,
            optBool:true,
            nested: Inner{ s:"abc", optAddr:null }
        };
    }
}