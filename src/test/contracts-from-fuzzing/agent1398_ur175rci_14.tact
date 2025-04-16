struct Sub {
    x: Int;
    y: String;
}

struct NestedArraySim {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract RepeatedNestedStruct {
    data: NestedArraySim;

    init() {
        self.data = NestedArraySim{
            s1: Sub{ x: 1, y: "a" },
            s2: Sub{ x: 2, y: "b" },
            s3: Sub{ x: 3, y: "c" }
        };
    }
}