struct BigNested {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: Bool;
    a5: Int;
    a6: Bool;
    a7: Int;
    a8: Bool;
    a9: Int;
    a10: Bool;
}

contract TestContract {
    nested: BigNested = BigNested{
        a1: 1, a2: true, a3: 2, a4: false, a5: 3, a6: true,
        a7: 4, a8: false, a9: 5, a10: true,
    };
    receive() {
        self.nested = BigNested{
            a1: 7, a2: false, a3: 7, a4: false, a5: 7, a6: false,
            a7: 7, a8: false, a9: 7, a10: false,
        };
    }
}