struct DeepOptWrap {
    inner: Int?;
}

struct OuterOptWrap {
    innerWrap: DeepOptWrap?;
    flag: Bool;
}

contract DeepOptComb {
    val: OuterOptWrap;

    init() {
        self.val = OuterOptWrap{
            innerWrap: null,
            flag: true
        };
    }
}