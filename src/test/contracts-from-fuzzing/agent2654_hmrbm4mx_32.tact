struct In {
    x: Int;
}
struct Out {
    y: Int;
    z: In;
}

contract StructsInStructs {
    o: Out;

    init() {
        self.o = Out{
            y: 10,
            z: In{x: 7}
        };
    }
}