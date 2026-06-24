struct SS {
    s: String;
}

contract StringAndOpt {
    a: String? = null;
    b: String = "hello";
    c: SS = SS{s: "world"};
}