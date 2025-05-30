// Now test a long chain of nested structs with large field lists
struct Level5 {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Level4 {
    nested: Level5;
    val1: Int;
    val2: Int;
}

struct Level3 {
    nested: Level4;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    s: String;
}

struct Level1 {
    nested: Level2;
    addr: Address?;
}

contract DeepHierarchy {
    data: Level1 = Level1{
        nested: Level2{
            nested: Level3{
                nested: Level4{
                    nested: Level5{ a:1,b:2,c:3,d:4,e:5 },
                    val1: 10,
                    val2: 20,
                },
                flag: true,
            },
            s: "hello",
        },
        addr: null,
    };

    init() {
        self.data.addr = myAddress();
    }
}