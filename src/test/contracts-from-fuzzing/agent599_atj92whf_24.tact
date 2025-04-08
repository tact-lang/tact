message(0xBEEF) OptMsg {}

struct Outer{
    m: OptMsg?;
}

contract OptionalMessagePersist {
    val: Outer;
    init() {
        self.val = Outer{m: null};
    }
}