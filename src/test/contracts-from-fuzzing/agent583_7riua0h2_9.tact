struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;
}

struct Bigger {
    one: Big;
    two: Big;
    three: Big;
}

contract BigStructContract {
    big: Bigger;

    init() {
        self.big = Bigger{
            one: Big{
                a:1,b:true,c:"c",d:2,e:false,f:"f",g:3,h:true,i:"i",j:4,k:false,l:"l",m:5,n:true,o:"o",p:6,q:false,r:"r",
            },
            two: Big{
                a:10,b:true,c:"cc",d:20,e:false,f:"ff",g:30,h:true,i:"ii",j:40,k:false,l:"ll",m:50,n:true,o:"oo",p:60,q:false,r:"rr",
            },
            three: Big{
                a:100,b:true,c:"ccc",d:200,e:false,f:"fff",g:300,h:true,i:"iii",j:400,k:false,l:"lll",m:500,n:true,o:"ooo",p:600,q:false,r:"rrr",
            },
        };
    }
}