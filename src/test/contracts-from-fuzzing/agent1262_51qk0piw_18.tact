struct Deep {
    inner: Int;
    flag: Bool;
    txt: String;
}

struct Wrapper {
    d: Deep;
    other: Bool;
}

contract MultiNest {
    w: Wrapper = Wrapper{ d: Deep{ inner:1, flag:true, txt:"x" }, other:false};
}