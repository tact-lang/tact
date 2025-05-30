struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3?;  // optional nested struct
}

struct Nested3 {
    flag: Bool;
    txt: String;
}

contract TestStorage {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        flag: true,
                        txt: "hello"
                    }
                }
            }
        };
    }
}
