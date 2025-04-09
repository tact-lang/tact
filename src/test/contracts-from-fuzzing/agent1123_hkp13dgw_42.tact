struct BigS {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract ManyBigs {
    x: BigS;
    y: BigS;
    z: BigS;

    init() {
        self.x = BigS{
            a:1,b:true,c:"c",d:2,e:false,f:"f",g:3,h:true,i:"i",j:4
        };
        self.y = BigS{
            a:5,b:false,c:"cc",d:6,e:true,f:"ff",g:7,h:false,i:"ii",j:8
        };
        self.z = BigS{
            a:9,b:true,c:"ccc",d:10,e:false,f:"fff",g:11,h:true,i:"iii",j:12
        };
    }
}