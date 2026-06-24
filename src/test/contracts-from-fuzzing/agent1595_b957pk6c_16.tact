struct BigNest1 {
    f1: Int; f2: Bool; f3: String; f4: Bool?; f5: String?; f6: Int?;
}

struct BigNest2 {
    a: BigNest1;
    b: BigNest1;
}

contract TestContract {
    data: BigNest2;

    init() {
        self.data = BigNest2{
            a: BigNest1{f1:1,f2:true,f3:"x",f4:null,f5:"y",f6:6},
            b: BigNest1{f1:2,f2:false,f3:"z",f4:true,f5:null,f6:null}
        };
    }
}