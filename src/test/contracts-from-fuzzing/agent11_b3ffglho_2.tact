struct Flat {
    a1: Int as uint32;
    a2: Int as uint32;
    a3: Int as uint32;
    a4: Int as uint32;
    a5: Int as uint32;
    a6: Int as uint32;
    a7: Int as uint32;
    a8: Int as uint32;
    a9: Int as uint32;
    a10: Int as uint32;
}

contract Test {
    receive() {
        let s: Flat = Flat{
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5, a6: 6, a7: 7, a8: 8, a9: 9, a10: 10
        };
    }
}
