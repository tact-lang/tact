struct Small {
    x: Int; 
}

struct MidOpt {
    y: Small?;
}

contract NestOpt {
    f: MidOpt;

    init() {
        self.f = MidOpt{ y:null };
    }
}