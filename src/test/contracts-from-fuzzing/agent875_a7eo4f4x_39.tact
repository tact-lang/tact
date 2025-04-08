struct WideBoolNull {
    a: Bool?; b: Bool?; c: Bool?; d: Bool?; e: Bool?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract WideBoolNullTest {
    w: WideBoolNull;
    init() {
        self.w = WideBoolNull{
            a:null, b:true, c:null, d:false, e:null,
            f:true, g:null, h:false, i:null, j:true
        };
    }
}