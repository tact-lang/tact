// Chain of nested structs, some with optionals & explicit defaults
struct Node3 {
    x:Int?;
    y:String = "Y";
}

struct Node2 {
    inner:Node3?;
    b:Bool = false;
}

struct Node1 {
    child:Node2?;
}

contract ChainDefaults {
    root:Node1;

    init() {
        self.root = Node1{
            child:null
        };
    }
}