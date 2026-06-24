struct DeepNest3 {
    leaf: Int;
}

struct DeepNest2 {
    mid: DeepNest3;
    flag: Bool;
}

struct DeepNest1 {
    root: DeepNest2;
    text: String;
}

contract DeepNesting {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            root: DeepNest2{
                mid: DeepNest3{leaf: 7},
                flag: true
            },
            text: "ok"
        };
    }

    receive() {
        let _ = self.data.root.mid.leaf;
    }
}