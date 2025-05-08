struct SerializeInner {
    a: Int as uint8;
    b: Int as int32;
}

contract SerializeNested {
    val: SerializeInner;

    init() {
        self.val = SerializeInner{
            a: 200,
            b: -10000
        };
    }
}
