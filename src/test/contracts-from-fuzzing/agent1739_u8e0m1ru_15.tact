struct Wide1 {
    a1: Int; a2: Bool; a3: String; a4: Int?; a5: String?;
}

struct Wide2 {
    b1: Wide1; b2: Wide1; b3: Wide1;
}

contract WideNestedStructs {
    data: Wide2;
    init() {
        self.data = Wide2{
            b1: Wide1{ a1:1, a2:true, a3:"x", a4:null, a5:null },
            b2: Wide1{ a1:2, a2:false, a3:"y", a4:4, a5:"z" },
            b3: Wide1{ a1:3, a2:true, a3:"w", a4:null, a5:null },
        };
    }
}