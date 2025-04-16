struct InnerOpt {
    k: Int?;
    m: Bool?;
}

contract OptStructVar {
    data: InnerOpt?;
    
    init() {
        self.data = InnerOpt{ k: 17, m: null };
    }
}