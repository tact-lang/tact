struct NestedLevel3 {
    x: Int;
}

struct NestedLevel2 {
    nl3: NestedLevel3;
    y: Bool;
}

struct NestedLevel1 {
    nl2: NestedLevel2;
    z: String;
}

contract DeepContract {
    deep: NestedLevel1;
    init() {
        self.deep = NestedLevel1{
            nl2: NestedLevel2{
                nl3: NestedLevel3{x: 777},
                y: true
            },
            z: "deep"
        };
    }
    receive() {}
}