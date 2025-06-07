struct InnerOpt {
    x: Int?;
}

contract BasicOptStruct {
    opt: InnerOpt? = null;
    
    init() {
        self.opt = InnerOpt{x:5};
    }
}