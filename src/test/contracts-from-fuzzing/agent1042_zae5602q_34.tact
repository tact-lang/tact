struct Reordered1 {
    a: Int;
    b: Bool?;
}

struct Reordered2 {
    b: Bool?;
    a: Int;
}

contract TestReorder {
    f1: Reordered1 = Reordered1{a:1,b:null};
    f2: Reordered2 = Reordered2{b:null,a:2};
}