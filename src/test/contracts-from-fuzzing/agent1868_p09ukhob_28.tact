struct Sub {
    v1: Int;
    v2: Bool;
}

struct Middle {
    s: Sub;
    flag: Bool;
}

struct Top {
    mid: Middle;
    s: String;
}

contract DeepFields {
    t: Top = Top{
        mid: Middle{
            s: Sub{
                v1:1,
                v2:true
            },
            flag:false
        },
        s: "X"
    };

    init() {}
}