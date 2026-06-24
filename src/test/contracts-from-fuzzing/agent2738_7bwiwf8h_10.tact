struct DeepOpt {
    s: Simple?;
}

struct Simple {
    x: Int;
    y: Bool;
    msg: String;
}

contract OptionalStruct {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{s:null};
    }
}
