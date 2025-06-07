struct Base {
    flag: Bool;
}

struct Wrap {
    base: Base;
    text: String;
}

contract StructWrap {
    val: Wrap = Wrap{
        base: Base{flag:true},
        text: "hi"
    };

    init() {}
}