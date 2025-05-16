struct Compose123 {
    i: Int;
    b: Bool;
    s: String;
}

struct NestedCompose {
    f1: Compose123;
    f2: Compose123;
    f3: Compose123;
}

contract RepeatedStructs {
    data: NestedCompose;

    init() {
        self.data = NestedCompose{
            f1: Compose123{i:1,b:true,s:"a"},
            f2: Compose123{i:2,b:false,s:"b"},
            f3: Compose123{i:3,b:true,s:"c"}
        };
    }
}