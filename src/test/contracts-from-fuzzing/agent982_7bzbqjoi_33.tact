struct ArraySim {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract FuzzArraySim {
    vals: ArraySim;

    init() {
        self.vals = ArraySim{a:1,b:2,c:3,d:4,e:5};
    }
}