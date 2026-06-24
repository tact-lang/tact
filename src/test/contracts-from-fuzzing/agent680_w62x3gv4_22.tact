struct SmallOpt {
    a: Int?;
    b: Bool?;
}

contract SimpleOptStructInitTest {
    so: SmallOpt = SmallOpt{a:null,b:null};

    init() {
        self.so = SmallOpt{a:42,b:true};
    }

    receive() {
        let _ = self.so.a != null ? self.so.a!! : 0;
    }
}