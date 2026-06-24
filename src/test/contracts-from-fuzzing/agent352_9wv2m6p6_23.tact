struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

struct DeepWrap {
    v: ManyOptionals;
    w: ManyOptionals;
    x: ManyOptionals;
    y: ManyOptionals;
    z: ManyOptionals;
}

contract Test {
    val: DeepWrap;

    init() {
        self.val = DeepWrap{
            v: ManyOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
            },
            w: ManyOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
            },
            x: ManyOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
            },
            y: ManyOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
            },
            z: ManyOptionals{
                a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
            }
        };
    }
}