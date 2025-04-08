struct ChainedOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
}

contract ChainOptTest {
    data: ChainedOptional;

    init() {
        self.data = ChainedOptional{ a:null, b:true, c:null };
    }
}