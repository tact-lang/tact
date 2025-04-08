struct Large0 { f0: Int; f1: Bool; f2: Int?; f3: Bool?; f4: Int; f5: Bool; f6: Int?; f7: Bool?; f8: Int; f9: Bool; }

contract WideFields {
    data: Large0;

    init() {
        self.data = Large0{
            f0:1,f1:true,f2:null,f3:null,f4:2,f5:false,f6:null,f7:null,f8:3,f9:true
        };
    }
}