struct BaseLayer {
    first: Layer1;
    second: Layer1;
}

struct Layer1 {
    content: Layer2;
    flag: Bool;
}

struct Layer2 {
    label: String;
    optVal: Int?;
}

contract DuplicateLayers {
    data: BaseLayer;

    init() {
        self.data = BaseLayer{
            first: Layer1{ content: Layer2{ label:"hi", optVal:null }, flag:true },
            second: Layer1{ content: Layer2{ label:"yo", optVal:null }, flag:false }
        };
    }
}
