struct N1 { f: Int; o: Bool?; }
struct N2 { nest: N1; s: String; }
struct N3 { deep: N2; opt: String?; }

contract OptStructs {
    data: N3;
    init() {
        self.data = N3{
            deep: N2{
                nest: N1{f:9, o:null},
                s: "ok"
            },
            opt: null
        };
    }
}