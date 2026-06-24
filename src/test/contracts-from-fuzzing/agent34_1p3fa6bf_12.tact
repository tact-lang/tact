struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

contract Test11 {
    val: Large?;
    init() {
        self.val = Large{a:1,b:true,c:"x",d:2,e:false,f:"y"};
    }
}