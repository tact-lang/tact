struct BigNested {
    nested1: Struct1;
    nested2: Struct2;
}

struct Struct1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Struct2 {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract BigNestedContract {
    val: BigNested;

    init() {
        self.val = BigNested{
            nested1: Struct1{ a:1, b:true, c:"hi" },
            nested2: Struct2{ x:null, y:null, z:null }
        };
    }
}