struct Deep1 { 
    value: Int; 
    }
struct Deep2 {
    deep: Deep1; 
    }
struct Deep3 {
    deep: Deep2;
}
struct Deep4 {
    deep: Deep3;
}
contract Test {
    d: Deep4;
    init() {
        self.d = Deep4{
            deep: Deep3{
                deep: Deep2{
                    deep: Deep1{ value: 123 }
                }
            }
        };
    }
}