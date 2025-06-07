struct Embed {
    val: Int;
}

struct OuterOpt {
    innerOpt: Embed?;
    flag: Bool;
}

contract Test {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            innerOpt: null,
            flag: false
        };
    }
}