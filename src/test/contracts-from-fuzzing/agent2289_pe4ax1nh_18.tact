struct Innermost {
    id: Int;
    msg: String;
}

struct Inner {
    obj: Innermost;
    optInt: Int?;
    flag: Bool;
}

struct Top {
    left: Inner;
    right: Inner;
    label: String;
}

contract TreeLike {
    root: Top;

    init() {
        self.root = Top{
            left: Inner{
                obj: Innermost{ id:1, msg:"a" },
                optInt: null,
                flag: true
            },
            right: Inner{
                obj: Innermost{ id:2, msg:"b" },
                optInt: 100,
                flag: false
            },
            label: "root"
        };
    }
}