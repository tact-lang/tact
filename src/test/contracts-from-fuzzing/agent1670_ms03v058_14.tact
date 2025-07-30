struct OptNested {
    nested: Inner?;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract TestOptNested {
    val: OptNested;
    init() {
        self.val = OptNested{
            nested: Inner{flag:true, text:"hi"}
        };
    }
}
