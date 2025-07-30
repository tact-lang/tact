struct HasBooleans {
    a: Bool;
    b: Bool;
    c: Bool?;
    d: Bool?;
}
contract BoolStructTest {
    data: HasBooleans;
    init() {
        self.data = HasBooleans{
            a:true, b:false, c:null, d:true
        };
    }
    receive() {
        let _ = ( (self.data.a) ? 1 : 0 ) + ( (self.data.b) ? 1 : 0 );
    }
}