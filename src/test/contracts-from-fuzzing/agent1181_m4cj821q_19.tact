struct AA {
    a: Int;
    b: Int?;
}

struct BB {
    c: AA;
    d: String;
}

struct CC {
    e: BB;
    f: Int;
}

contract TestContract {
    data: CC;

    init() {
        self.data = CC{
            e: BB{
                c: AA{a:1,b:null},
                d:"string"
            },
            f: 42
        };
    }
}