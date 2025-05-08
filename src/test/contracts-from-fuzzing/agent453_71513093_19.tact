struct OptionNested {
    f1: Int?;
    f2: SubS?;
}

struct SubS {
    a: Bool?;
    b: Int;
}

contract TestContract {
    st: OptionNested;
    init(){
        self.st = OptionNested{
            f1:null,
            f2:SubS{
                a:true,
                b:888
            }
        };
    }
}