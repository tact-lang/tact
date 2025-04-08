struct NestedManyLevels {
    a: Int;
    b: Inner1;
}

struct Inner1 {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    z: String;
    k: Inner3;
}

struct Inner3 {
    flag: Bool;
    tail: String?;
}

contract MultiLevelNestedStorage {
    data: NestedManyLevels;

    init() {
        self.data = NestedManyLevels{
            a:42,
            b: Inner1{
                x:7,
                y: Inner2{
                    z:"hi",
                    k: Inner3{flag:true, tail:null}
                }
            }
        };
    }
}