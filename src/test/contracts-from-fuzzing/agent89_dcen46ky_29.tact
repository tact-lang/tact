struct MultiLevel {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

struct Container {
    main: MultiLevel;
}

contract Fuzz29 {
    data: Container;

    init() {
        self.data = Container{
            main: MultiLevel{
                a:1,b:null,c:"hi",d:null,e:true,f:false
            }
        };
    }
}