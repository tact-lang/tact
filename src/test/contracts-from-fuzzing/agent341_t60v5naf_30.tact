struct CrazyNested {
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
}

struct ContainerL1 {
    c1: CrazyNested;
}

struct ContainerL2 {
    c2: ContainerL1;
}

contract DeepCrazy {
    val: ContainerL2;

    init() {
        self.val = ContainerL2{
            c2: ContainerL1{
                c1: CrazyNested{
                    a:1,b:true,c:"c",d:null,e:null,f:"f",
                    g:7,h:false,i:"i",j:10,k:true,l:null
                }
            }
        };
    }
}