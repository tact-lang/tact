struct Inner {
    x: Int?;
    y: Bool?;
}

struct Wrapper {
    a: Inner?;
    b: Inner;
}

contract InnerOptional {
    w: Wrapper;
    
    init() {
        self.w = Wrapper{
            a:null,
            b:Inner{ x:null, y:null }
        };
    }
}