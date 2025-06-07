struct HasStringInner {
    name: String;
    opt: Int?;
}

struct Wrap {
    wrapped: HasStringInner;
}

contract StructInStructStringOptional {
    val: Wrap;
    init() {
        self.val = Wrap{wrapped: HasStringInner{name: "Jon", opt: null}};
    }
}