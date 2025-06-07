struct Atomic {
    x: Int as uint4;
    y: Int as uint4;
    flag: Bool;
}

contract StructSerialize {
    atom: Atomic;

    init() {
        self.atom = Atomic{
            x: 15,
            y: 5,
            flag: true
        };
    }
}