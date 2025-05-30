struct NestOpt {
    optInt: Int?;
    optBool: Bool?;
}

contract NestOptFields {
    f: NestOpt = NestOpt{optInt:null, optBool:null};

    init() {
        self.f = NestOpt{optInt:5, optBool:true};
    }
}
