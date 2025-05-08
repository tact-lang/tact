struct Inner {
    b: Bool;
}

struct Mid {
    i: Inner;
}

struct Outer {
    m: Mid;
}

contract DeepWrapped {
    val: Outer;

    init() {
        self.val = Outer{ m: Mid{ i: Inner{b:true} } };
    }
}