struct SLevel3 {
    data: String; 
}

struct SLevel2 {
    l3: SLevel3;
}

struct SLevel1 {
    l2: SLevel2;
}

contract Deep3 {
    top: SLevel1;

    init() {
        self.top = SLevel1{
            l2: SLevel2{
                l3: SLevel3{
                    data: "deep"
                }
            }
        };
    }
}