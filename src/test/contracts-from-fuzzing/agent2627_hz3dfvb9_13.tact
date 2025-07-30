struct Inner {
    x: Int;
    y: Bool;
}

contract DefaultTest {
    data: Inner = Inner{x:5,y:false};
    init() {
        self.data = Inner{x:10,y:true};
    }
}