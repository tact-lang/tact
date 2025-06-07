struct BigOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
}

contract ManyOptionals {
    s: BigOptional;

    init() {
        self.s = BigOptional{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null
        };
    }

    receive() {
        self.s = BigOptional{
            a:1,b:2,c:3,d:4,e:5,
            f:6,g:7,h:8,i:9,j:10
        };
    }
}