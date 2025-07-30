struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract MultiBoolTest {
    mb: MultiBool;

    init() {
        self.mb = MultiBool{
            a:true,
            b:true,
            c:false,
            d:true
        };
    }
}
