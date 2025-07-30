struct StructOpt {
    inner: Int?;
}

contract StructOptTest {
    data: StructOpt?;
    init() {
        self.data = null;
    }
}