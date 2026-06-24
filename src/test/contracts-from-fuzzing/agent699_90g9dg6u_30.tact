struct Deep {
    layer1:Int;
    layer2:String;
    layer3:Bool;
    layer4:Int?
}

struct Higher {
    inner:Deep;
    other:String?;
}

contract NestedHigher {
    state: Higher;
    init() {
        self.state = Higher{
            inner:Deep{layer1:1,layer2:"x",layer3:true,layer4:null},
            other:null
        };
    }
}