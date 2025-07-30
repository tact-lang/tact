struct SerOpt {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract SerOptTest {
    s: SerOpt;

    init() {
        self.s = SerOpt{
            a:null, b:null, c:null
        };
    }
}
