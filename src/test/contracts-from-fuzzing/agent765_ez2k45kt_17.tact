struct Large {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract TestContract {
    one: Large;
    two: Large;
    three: Large;
    four: Large;

    init() {
        let l = Large{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.one = l;
        self.two = l;
        self.three = l;
        self.four = l;
    }
}