struct RecA {
    x: Int;
}

struct RecB {
    a: RecA;
    y: Int;
}

struct RecC {
    b: RecB;
    z: Int;
}

contract SnakedStruct {
    val: RecC;

    init() {
        self.val = RecC{
            b: RecB{
                a: RecA{ x: 1 },
                y: 2
            },
            z: 3
        };
    }
}