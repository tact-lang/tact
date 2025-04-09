struct DeepLevel3 {
    z: Int;
    t: Bool;
}

struct DeepLevel2 {
    inner: DeepLevel3;
    s: String;
}

struct DeepLevel1 {
    inner: DeepLevel2;
    a: Int;
}

contract DeeplyNested {
    nest: DeepLevel1;

    init() {
        self.nest = DeepLevel1{
            inner: DeepLevel2{
                inner: DeepLevel3{
                    z: 5,
                    t: true
                },
                s: "nest"
            },
            a: 42
        };
    }
}