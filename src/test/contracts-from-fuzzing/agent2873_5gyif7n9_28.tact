struct Outer2 {
    s1: String;
    s2: String;
}

struct Wrapping {
    o: Outer2;
    b: Bool;
}

contract NestStringBool {
    val: Wrapping;
    init() {
        self.val = Wrapping{ o: Outer2{s1:"x", s2:"y"}, b:true };
    }
}