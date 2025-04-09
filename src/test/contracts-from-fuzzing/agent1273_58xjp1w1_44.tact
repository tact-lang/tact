struct TinyOpt {
    o: Int?;
}

contract NullDefault {
    f: TinyOpt;

    init() {
        self.f = TinyOpt{o:null};
    }
}