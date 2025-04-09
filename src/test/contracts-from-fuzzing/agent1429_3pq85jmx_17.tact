struct Sub {
    x: Int;
    y: String;
}

struct Middle {
    sub: Sub;
    flag: Bool;
}

contract NestStructs {
    val: Middle;

    init() {
        self.val = Middle{
            sub: Sub{ x: 10, y: "y" },
            flag: true
        };
    }
}