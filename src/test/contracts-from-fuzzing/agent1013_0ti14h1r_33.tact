struct BigNester1 {
    a: Int; b: Bool; c: String; d: Address; e: Cell;
}

struct BigNester2 {
    n1: BigNester1; 
    optS: String?; 
    optB: Bool?;
}

struct BigNester3 {
    n2: BigNester2; n1: BigNester1; 
}

contract BrutalNested {
    top: BigNester3;

    init() {
        self.top = BigNester3{
            n2:BigNester2{
                n1:BigNester1{a:1,b:true,c:"c",d:myAddress(),e:emptyCell()},
                optS:null,optB:null
            },
            n1:BigNester1{a:2,b:false,c:"z",d:myAddress(),e:emptyCell()}
        };
    }
}
