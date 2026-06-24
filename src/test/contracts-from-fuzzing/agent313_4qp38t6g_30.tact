// deliberately large composition of optionals
struct BigOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
}

contract ManyOptionalsTest {
    val: BigOptionals;

    init() {
        self.val = BigOptionals{
            a:null,b:null,c:1,d:2,e:null,
            f:3,g:null,h:4,i:null,j:5
        };
    }
}