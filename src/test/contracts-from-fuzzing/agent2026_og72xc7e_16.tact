struct BoolIntStr {
    flag: Bool;
    num: Int;
    text: String;
}

struct Container {
    item1: BoolIntStr;
    item2: BoolIntStr;
    item3: BoolIntStr;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            item1: BoolIntStr{flag:true,num:1,text:"a"},
            item2: BoolIntStr{flag:false,num:2,text:"b"},
            item3: BoolIntStr{flag:true,num:3,text:"c"}
        };
    }
}