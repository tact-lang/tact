struct Complex {
    a: Int?;
    b: Bool;
    c: String;
    d: Int;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract TestContract {
    st: Complex = Complex{
        a:null,b:true,c:"x",d:1,e:null,f:null,g:2,h:false,i:"y",j:3,k:true,l:null
    };

    init() {
        self.st = Complex{
            a:10,b:false,c:"z",d:20,e:true,f:"xx",g:30,h:true,i:"yy",j:40,k:null,l:"zz"
        };
    }

    receive() {
        let _ = self.st.k;
    }
}