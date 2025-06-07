struct Struct1 {
    flag: Bool;
    text: String;
}

struct Struct2 {
    sub: Struct1;
    num: Int;
}

contract LayeredNested {
    layer: Struct2;

    init() {
        self.layer = Struct2{
            sub: Struct1{
                flag: true,
                text: "data"
            },
            num: 55
        };
    }
}