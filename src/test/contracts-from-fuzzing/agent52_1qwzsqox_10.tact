struct MultiLayer {
    layer1: Layer1;
}

struct Layer1 {
    layer2a: Layer2;
    layer2b: Layer2;
}

struct Layer2 {
    flag: Bool;
    message: String;
    cell: Cell;
    addr: Address;
    optInt: Int?;
}

contract TestContract {
    storage: MultiLayer;

    init() {
        self.storage = MultiLayer{
            layer1: Layer1{
                layer2a: Layer2{
                    flag:true,message:"abc",cell:emptyCell(),addr:myAddress(),optInt:null
                },
                layer2b: Layer2{
                    flag:false,message:"def",cell:emptyCell(),addr:myAddress(),optInt:5
                }
            }
        };
    }
}
