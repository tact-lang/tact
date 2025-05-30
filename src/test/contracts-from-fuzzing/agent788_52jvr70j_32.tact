struct Deep {
    inner: Int;
}

contract DefaultValImplicit {
    x: Deep;
    
    init() {
        self.x = Deep{
            inner: 0
        };
    }
}