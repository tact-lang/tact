struct SelfReference {
    a: Int;
}

contract TestSelfRef {
    x: SelfReference;

    init() {
        self.x = SelfReference{
            a: 5
        };
    }
}