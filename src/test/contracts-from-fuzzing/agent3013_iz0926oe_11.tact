struct Wrapper {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayOfStructs {
    s1: Wrapper;
    s2: Wrapper;
    s3: Wrapper;

    init() {
        self.s1 = Wrapper{a:1,b:true,c:"x"};
        self.s2 = Wrapper{a:2,b:false,c:"y"};
        self.s3 = Wrapper{a:3,b:true,c:"z"};
    }
}
