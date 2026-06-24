struct DeepStruct {
    level: Int;
    child: ChildStruct;
}

struct ChildStruct {
    flag: Bool;
    leaf: LeafStruct;
}

struct LeafStruct {
    answer: Int;
    status: Bool;
}

contract DeeplyCombined {
    complex: DeepStruct;

    init() {
        self.complex = DeepStruct{
            level: 1,
            child: ChildStruct{
                flag: true,
                leaf: LeafStruct{
                    answer: 42,
                    status: false
                }
            }
        };
    }
}